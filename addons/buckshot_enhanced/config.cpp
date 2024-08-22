#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "loadorder_f_vietnam" }; // Include addons from this mod that contain code or assets you depend on. Affects loadorder. Including main as an example here.
        authors[] = {"Bluefield"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        VERSION_CONFIG;
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
#include "cfgMagazines.hpp"
#include "cfgAmmo.hpp"