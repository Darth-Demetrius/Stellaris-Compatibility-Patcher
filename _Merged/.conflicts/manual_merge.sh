#!/usr/bin/env bash
set -u
cd '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod'
command -v code >/dev/null 2>&1 || { echo 'VS Code CLI not found: install/enable the `code` shell command first.'; exit 1; }

# Opens the auto-generated seed file plus source diffs in VS Code. Edit the seed file on the right and save it.

printf '
=== district_arcology_housing ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_housing.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_housing/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_housing.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/01_arcology_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_housing/External Mods/BPVR - More Building Slots_01_arcology_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_housing.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/01_arcology_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_housing/External Mods/Planetary Diversity - More Arcologies_01_arcology_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_housing.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_housing.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_arcology_leisure ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_leisure.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_leisure/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_leisure.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/01_arcology_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_leisure/External Mods/BPVR - More Building Slots_01_arcology_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_leisure.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/01_arcology_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_arcology_leisure/External Mods/Planetary Diversity - More Arcologies_01_arcology_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_leisure.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_arcology_leisure.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_battle_thrall ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_battle_thrall.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_battle_thrall/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_battle_thrall.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_battle_thrall/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_battle_thrall.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_battle_thrall/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_battle_thrall.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_battle_thrall.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_city ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_city.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_city/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_city.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_city/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_city.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_city/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_city.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_city.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_crashed_slaver_ship ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_crashed_slaver_ship.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_crashed_slaver_ship/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_crashed_slaver_ship.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_crashed_slaver_ship/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_crashed_slaver_ship.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_crashed_slaver_ship/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_crashed_slaver_ship.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_crashed_slaver_ship.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_hive ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_hive.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_hive/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_hive.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_hive/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_hive.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_hive/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_hive.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_hive.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_nexus ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_nexus.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_nexus/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_nexus.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_nexus/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_nexus.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_nexus/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_nexus.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_nexus.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_pd_commercial_arcology_housing ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_commercial_arcology_housing.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/pd_arcology_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_commercial_arcology_housing/External Mods/Planetary Diversity - More Arcologies_pd_arcology_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_commercial_arcology_housing.txt'
printf 'source: %s
' '_My Patch/common/districts/district_pd_arcologies_housing.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_commercial_arcology_housing/_My Patch_district_pd_arcologies_housing.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_commercial_arcology_housing.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_commercial_arcology_housing.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_pd_fortress_arcology_housing ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_fortress_arcology_housing.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/pd_arcology_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_fortress_arcology_housing/External Mods/Planetary Diversity - More Arcologies_pd_arcology_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_fortress_arcology_housing.txt'
printf 'source: %s
' '_My Patch/common/districts/district_pd_arcologies_housing.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_fortress_arcology_housing/_My Patch_district_pd_arcologies_housing.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_fortress_arcology_housing.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_fortress_arcology_housing.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_pd_garden_arcology_housing ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_garden_arcology_housing.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/pd_arcology_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_garden_arcology_housing/External Mods/Planetary Diversity - More Arcologies_pd_arcology_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_garden_arcology_housing.txt'
printf 'source: %s
' '_My Patch/common/districts/district_pd_arcologies_housing.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_pd_garden_arcology_housing/_My Patch_district_pd_arcologies_housing.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_garden_arcology_housing.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_pd_garden_arcology_housing.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_prison ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_prison_industrial ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison_industrial.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison_industrial/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison_industrial.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison_industrial/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison_industrial.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_prison_industrial/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison_industrial.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_prison_industrial.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_resort ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_resort.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_resort/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_resort.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_resort/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_resort.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_resort/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_resort.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_resort.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== district_slave ===
'
code --reuse-window '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_slave.txt'
printf 'source: %s
' 'External Mods/BPVR - Compatibility Patch/common/districts/����_all_merged_common_items.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_slave/External Mods/BPVR - Compatibility Patch_����_all_merged_common_items.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_slave.txt'
printf 'source: %s
' 'External Mods/BPVR - More Building Slots/common/districts/00_urban_districts_replace.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_slave/External Mods/BPVR - More Building Slots_00_urban_districts_replace.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_slave.txt'
printf 'source: %s
' 'External Mods/Planetary Diversity - More Arcologies/common/districts/00_urban_districts.txt'
code --reuse-window --diff '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/.upstream_tracking/common/districts/district_slave/External Mods/Planetary Diversity - More Arcologies_00_urban_districts.txt' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_slave.txt'
printf 'after editing, run: git add %s
' '/disks/Storage/Code Workspaces/BPVR - PD Arcology Patch/Stellaris/mod/_Merged/common/districts/district_slave.txt'
read -r -p 'Press Enter for the next object...' _

printf '
=== after all files are resolved ===
'
printf 'run: python3 .scripts/update_workflow.py build
'
