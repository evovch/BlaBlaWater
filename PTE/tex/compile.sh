#!/bin/bash

cat abstract.tex > fullCompilation.tex
cat 0_intro.tex >> fullCompilation.tex
cat 1_mapmt.tex >> fullCompilation.tex
cat 2_readout.tex >> fullCompilation.tex
head -n1 3_setups.tex >> fullCompilation.tex
cat 3_1_beamtime_setup.tex >> fullCompilation.tex
cat 3_2_lab_setup.tex >> fullCompilation.tex
cat 4_soft.tex >> fullCompilation.tex
head -n1 5_results.tex >> fullCompilation.tex
cat 5_1_flib.tex >> fullCompilation.tex
cat 5_2_ft_calib.tex >> fullCompilation.tex
cat 5_3_corrections.tex >> fullCompilation.tex
cat 5_4_time_resolution.tex >> fullCompilation.tex
cat 5_5_wls.tex >> fullCompilation.tex
cat 5_6_tot.tex >> fullCompilation.tex
cat 5_7_nx_vs_padiwa.tex >> fullCompilation.tex
cat summary.tex >> fullCompilation.tex
cat 6_bibliography.tex >> fullCompilation.tex

