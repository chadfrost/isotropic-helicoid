/* First cut at modeling an isotropic helicoid, suitable
 * for experiments as per Lord Kelvin in 1871, and paper
 * https://doi.org/10.1103/PhysRevFluids.6.074302 (see 
 * also article, https://physics.aps.org/articles/v14/s89)
 *
 * https://www.thingiverse.com/thing:4919640
 *
 * Note, if printed in PLA, must be at least ~80% infill
 * or it will float in water!
 * 
 * Density of common FDM materials (good table at 
 * https://omnexus.specialchem.com/polymer-properties/properties/density):
 * PLA = ~1.25g/cm^3
 * ABS = 1.0 - 1.05 g/cm^3
 * PETG = 1.27 - 1.38 g/cm^3
 *
 * C. Frost 7/2021
 */

// Dimensions in mm, deg
sphere_diam = 50;
fin_diam = 20;
fin_thickness = 4;
fin_angle = 45;

sphere(d=sphere_diam, $fn=100);

// x-y plane
rotate([0, 0, 45])
fins(fin_diam, fin_thickness, fin_angle);

// x-z plane
rotate([90, 45, 0])
fins(fin_diam, fin_thickness, fin_angle);

// y-z plane
rotate([90, 45, 90])
fins(fin_diam, fin_thickness, fin_angle);

module fins(fin_diam, fin_thickness, fin_angle){
    for (i=[0:3])
        rotate([fin_angle, 0, 90*i])
            translate([sphere_diam/2, 0, 0])
                resize(newsize=[fin_diam, fin_diam, fin_thickness]) sphere(d=fin_diam);
}