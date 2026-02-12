/* THREAD-SPIKE-GENERATOR 
   A parametric mask for refractors using thin threads/lines.
*/


/* [Main Dimensions] */
// Inner diameter of the optics (clear aperture)
optics_diameter = 80; 
// Outer diameter of your telescope's dew shield
dew_shield_diameter = 100; 
// Total outer diameter of the front plate (for glueing area)
total_outer_diameter = 130;
// Depth of the ring sliding over the dew shield
sleeve_depth = 20; 
// Thickness of the front plate (top cover)
top_thickness = 5; 
// Wall thickness of the mounting sleeve
wall_thickness = 3;

/* [Spike Settings] */
// Number of continuous lines (e.g., 2 for a classic cross)
number_of_spikes = 2; 
// Width of the V-groove at the top
v_groove_width = 3; 

/* [Resolution & Precision] */
// Higher value = smoother circles (100-300 is usually perfect)
$fn = 200; 
// Fitting tolerance (added to dew shield diameter)
fit_tolerance = 0.4; 

// Epsilon for clean boolean operations
eps = 0.01; 

// Internal Logic
inner_d = dew_shield_diameter + fit_tolerance;
sleeve_outer_d = inner_d + (wall_thickness * 2);
plate_outer_d = max(total_outer_diameter, sleeve_outer_d);

module spike_generator() {
    difference() {
        // 1. MAIN BODY
        union() {
            // Mounting Sleeve
            cylinder(d = sleeve_outer_d, h = sleeve_depth);
            
            // Structural Reinforcement (Bevel/Fillet substitute)
            // This adds a small conical transition for strength
            translate([0, 0, sleeve_depth - 3])
                cylinder(d1 = sleeve_outer_d, d2 = plate_outer_d, h = 3);
            
            // The wide Front Plate (Flange)
            translate([0, 0, sleeve_depth])
                cylinder(d = plate_outer_d, h = top_thickness);
        }

        // 2. SUBTRACT: Space for the Dew Shield
        translate([0, 0, -eps])
            cylinder(d = inner_d, h = sleeve_depth + eps);

        // 3. SUBTRACT: Main Aperture Hole
        translate([0, 0, sleeve_depth - 1])
            cylinder(d = optics_diameter, h = top_thickness + 1 + eps);

        // 4. SUBTRACT: V-Grooves
        translate([0, 0, sleeve_depth + top_thickness + eps])
            create_v_grooves(plate_outer_d);
    }
}

module create_v_grooves(diameter) {
    angle_step = 180 / number_of_spikes;
    for (i = [0 : number_of_spikes - 1]) {
        rotate([0, 0, i * angle_step]) {
            rotate([45, 0, 0])
                cube([diameter + 10, v_groove_width, v_groove_width], center = true);
        }
    }
}

// Execute Model
spike_generator();