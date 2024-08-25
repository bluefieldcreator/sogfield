class cfgWeapons {
  class vn_rifle;
  class vn_m79: vn_rifle {
    class vn_m79_muzzle;
    class vn_m79_shot_muzzle: vn_m79_muzzle {
        magazines[] += { "sogfield_40mm_576_buck_mag" };
    };
  };
};