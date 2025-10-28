# Procedural-Terrain-Generator-for-Godot
Procedural terrain generation for Godot 4 based on MeshInstance3D and a height map.

<div style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 20px;">
    <img src="screenshots/LandscapeTitle.png" style="width: 100%; margin-bottom: 10px;">


# Usage
1. Attach the `terrain_generator.gd` script to a **MeshInstance3D** node.
2. **Set the Heightmap Path:** Specify the path to your height map image file (e.g., PNG, JPG, etc.).
3. **Configure the Mesh:** Ensure the MeshInstance3D uses a **PlaneMesh** resource.
4. Adjust the **Subdivisions** property to control the terrain detail. Be careful, as a **subdivisions value greater than the map size** may result in "steps" on the surface!

Tested on Godot 4.4.
It’s public domain, so use it however you want!

# Screenshots
some ugly... but cool, lol

<div style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 20px;">
    <img src="screenshots/Screenshot_24.jpg" style="width: 49%; border: 1px solid #ccc; margin-bottom: 10px;">
    <img src="screenshots/Screenshot_25.jpg" style="width: 49%; border: 1px solid #ccc; margin-bottom: 10px;">
    <img src="screenshots/Screenshot_26.jpg" style="width: 49%; border: 1px solid #ccc; margin-bottom: 10px;">
    <img src="screenshots/Screenshot_27.jpg" style="width: 49%; border: 1px solid #ccc; margin-bottom: 10px;">
</div>
