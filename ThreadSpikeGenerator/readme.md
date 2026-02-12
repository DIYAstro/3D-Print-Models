# Documentation: Thread Spike Parametric Generator

This OpenSCAD script generates a mounting frame for refractor telescopes to create diffraction spikes. Instead of printed vanes, it uses V-shaped grooves to align and hold thin threads or wires across the aperture.

---

## Requirements & Recommendation

> [!IMPORTANT]
> **Recommended Software:** Use **[OpenSCAD Nightly (Development Snapshot)](https://openscad.org/downloads.html#snapshots)**. 
> The nightly versions include the newer **Manifold** engine, which handles complex boolean operations (like the V-grooves in this model) much faster and more reliably than the stable release.

---

## Technical Parameters

### Base Geometry
* optics_diameter: Internal clear aperture. Matches the lens diameter of the telescope.
* dew_shield_diameter: Exact outer diameter of the telescope's dew shield.
* total_outer_diameter: The final diameter of the top flange. Defines the available surface for thread attachment and glueing.
* sleeve_depth: Length of the cylindrical part that slides over the dew shield.
* top_thickness: Thickness of the front plate containing the grooves.
* wall_thickness: Radial thickness of the mounting sleeve.

### Spike Configuration
* number_of_spikes: Number of continuous lines crossing the center.
    * 2 results in 4 spikes (90° offset).
    * 3 results in 6 spikes (60° offset).
* v_groove_width: Top opening width of the V-notch. The V-shape ensures self-centering for various thread gauges.
* thread_hole_diameter: Diameter of the holes at the outer ends of the grooves for easy threading and fixing.

### Tolerances & Resolution
* $fn: Circular resolution (fragment count). Set to 200 for smooth surfaces.
* fit_tolerance: Dimensional offset added to the internal diameter to ensure the part fits onto the telescope without excessive force.

---

## Usage & Assembly

### 3D Printing
* Orientation: Invert the model 180° in the slicer. The wide flange must sit flat on the build plate.
* Supports: Not required when printed flange-down.
* Material: PETG or ASA recommended for UV resistance and mechanical stability under thread tension.

### Threading
1. Place the telescope mask on a flat surface.
2. Route the thread (e.g., mono-filament fishing line or wire) through the opposing V-grooves.
3. Temporarily fix the ends on the outer rim with tape.
4. Apply a small amount of adhesive (e.g., epoxy) directly into the groove. 
5. Trim excess thread after the adhesive has cured.

### Alignment
Rotate the mask on the dew shield to align the spikes with the camera sensor axes as required.