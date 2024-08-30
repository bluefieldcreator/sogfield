#include "script_component.hpp"

SOGFIELD_fnc_LandScape = {
	params ["_projectile"];
	_projectile addEventHandler ["Explode", {
		params ["_projectile", "_pos", "_velocity"];
		systemChat format ["IMPACT - %1", _projectile];

		private _bushes = nearestTerrainObjects [_pos, ["Bush"], 50];
		private _trees = nearestTerrainObjects [_pos, ["Tree"], 50];
		private _burntTrees = ["land_vn_embers_t_cocosnucifera_01", "land_vn_embers_t_cocosnucifera_02", "land_vn_embers_t_cocosnucifera_03"];

		// // BUSH PROCESSING//// 
		[{
			params ["_list", "_time"];

			if (_time > CBA_missionTime) exitWith {
				false
			};
			_this set [1, _time + 1];

			private _item = _list deleteAt 0;
			"vn_ground_embers_01" createVehicle (position _item);
			_item hideObjectGlobal true;
			systemChat str _item;

			_list isEqualTo []
		}, {
			systemChat "done";
		}, [_bushes, CBA_missionTime + 1]] call CBA_fnc_waitUntilAndExecute;

		//// // TREE PROCESSING//// 
		[{
			params ["_trees", "_time"];

			if (_time > CBA_missionTime) exitWith {
				false
			};
			_this set [1, _time + 1];
			private _item = _trees deleteAt 0;
			_item hideObjectGlobal true;
			systemChat str _item;
			selectRandom _burntTrees createVehicle position _item;

			_trees isEqualTo []
		}, {
			systemChat "done";
		}, [_trees, CBA_missionTime + 1]] call CBA_fnc_waitUntilAndExecute;
	}];
};

["Plane", "fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	switch (_ammo) do
	{
		case "vn_bomb_750_blu1b_fb_ammo": {
			[_projectile] call SOGFIELD_fnc_LandScape;
		};
		case "vn_bomb_500_blu1b_fb_ammo": {
			[_projectile] call SOGFIELD_fnc_LandScape;
		};
	};
}] call CBA_fnc_addClassEventHandler;