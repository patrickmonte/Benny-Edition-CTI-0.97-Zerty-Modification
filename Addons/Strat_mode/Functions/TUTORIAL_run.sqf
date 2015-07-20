player allowDamage false;
_pos=getMarkerPos "CTI_TUTORIAL";
_pos = [_pos,5,20] call CTI_CO_FNC_GetRandomPosition;
player setPos _pos;

waitUntil {(profileNamespace getVariable ["TUTO_COMPLETE",false]) || missionNamespace getVariable ["TUTO_COMPLETE",false]};
waitUntil {!isNil {CTI_P_SideLogic getVariable "cti_structures"} && !isNil {CTI_P_SideLogic getVariable "cti_hq"}};

12452 cutText ["Tutorial exited, sending to game ...", "PLAIN", 0];

_spawn_at=objNull;

if (!(CTI_P_Jailed)) then {
	player allowDamage true;
	while {isNull _spawn_at} do {
		_hq = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideHQ;
		_structures = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideStructures;

		_spawn_at = _hq;
		if (count _structures > 0) then { _spawn_at = [_hq, _structures] call CTI_CO_FNC_GetClosestEntity };
		sleep 1;
	};
	_spawn_at = [_spawn_at, 8, 30] call CTI_CO_FNC_GetRandomPosition;
	player setPos _spawn_at;
	sleep 2;
	12452 cutText ["", "PLAIN", 0];
};