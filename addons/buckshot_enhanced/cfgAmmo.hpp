class cfgAmmo {


    class ACE_12Gauge_Pellets_Submunition_No4_Buck_Deploy;
    class sogfield_12Gauge_Pellets : ACE_12Gauge_Pellets_Submunition_No4_Buck_Deploy {
        hit = 24;
    };
    
    class vn_40mm_m576_buck_ammo;
    class sogfield_40mm_m576_buck_ammo: vn_40mm_m576_buck_ammo
    {
        submunitionAmmo = "sogfield_12Gauge_Pellets";
        triggerTime = 0.2;
        submunitionConeType[] = { "poissondisccenter", 45 };
        submunitionInitSpeed = 400;
        submunitionParentSpeedCoef = 0;
    };
};
