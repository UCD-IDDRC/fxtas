# Clear existing data and graphics
rm(list = ls())
graphics.off()
# Load Hmisc library
library(Hmisc)
# Read Data
data <- read.csv("CTSC1647Trajectories-Ezra_DATA_2023-10-04_1455.csv")
# Setting Labels

label(data$study_id) <- "Study ID Number"
label(data$redcap_event_name) <- "Event Name"
label(data$dem_trax_subj_id) <- "Subject ID (FXS ID)"
label(data$dem_trax_date) <- "Date Consent Signed"
label(data$dem_trax_visit) <- "Visit Number"
label(data$dem_trax_age) <- "Calculated Age for Current Visit"
label(data$dem_trax_gender) <- "Gender"
label(data$dem_trax_race) <- "Primary Race"
label(data$dem_trax_eth) <- "Primary Ethnicity"
label(data$dem_trax_category) <- "FMR1 Category"
label(data$dem_edlev) <- "Education Level"
label(data$dem_edyr) <- "Years of Education"
label(data$kin_l_kintrem) <- "Left: Kinetic Tremor"
label(data$kin_l_posttrem) <- "Left: Postural Tremor"
label(data$kin_l_resttrem) <- "Left: Rest Tremor"
label(data$kin_r_kintrem) <- "Right: Kinetic Tremor"
label(data$kin_r_posttrem) <- "Right: Postural Tremor"
label(data$kin_r_resttrem) <- "Right: Rest Tremor"
label(data$mds_crx1) <- "Current Medications 1"
label(data$mds_crx10) <- "Current Medications 10"
label(data$mds_crx2) <- "Current Medications 2"
label(data$mds_crx3) <- "Current Medications 3"
label(data$mds_crx4) <- "Current Medications 4"
label(data$mds_crx5) <- "Current Medications 5"
label(data$mds_crx6) <- "Current Medications 6"
label(data$mds_crx7) <- "Current Medications 7"
label(data$mds_crx8) <- "Current Medications 8"
label(data$mds_crx9) <- "Current Medications 9"
label(data$mds_fxtas_stage) <- "FXTAS Stage (0-5)"
label(data$mds_med_ca_other) <- "Other Cancer"
label(data$mds_med_hyethy) <- "Hyperthyroid"
label(data$mds_med_hyothy) <- "Hypothyroid"
label(data$mds_med_ido_notes) <- "Other immunological disease & other symptoms: list"
label(data$mds_med_lup) <- "Lupus"
label(data$mds_med_mswk) <- "Multiple Sclerosis: Workup"
label(data$mds_med_proca) <- "Prostate Cancer"
label(data$mds_med_ra) <- "Rheumatoid arthritis"
label(data$mds_med_ray) <- "Raynauds disease"
label(data$mds_med_sjo) <- "Sjogrens Syndrome"
label(data$mds_med_sur) <- "Surgery"
label(data$mds_med_sur_notes) <- "Surgery type"
label(data$mds_med_thy) <- "Thyroid problems"
label(data$mds_med_thyca) <- "Thyroid Cancer"
label(data$mds_ne_it) <- "Intention tremor"
label(data$mds_ne_pfit) <- "Increased tone"
label(data$mds_ne_pfmf) <- "Masked faces"
label(data$mds_ne_pfprt) <- "Pill-rolling tremor"
label(data$mds_ne_pfsg) <- "Stiff gait"
label(data$mds_ne_pt) <- "Postural tremor"
label(data$mds_ne_rt) <- "Resting tremor"
label(data$mds_neu_atax) <- "Problem with walking/ataxia"
label(data$mds_neu_atax_age) <- "Hx Ataxia: Age of onset"
label(data$mds_neu_atax_sev) <- "Gait ataxia severity"
label(data$mds_neu_trem_age) <- "Tremor Age of onset"
label(data$mds_neu_trem_irm) <- "Intermittent tremor hx"
label(data$mds_psy_dri) <- "# of drinks per day now"
label(data$mds_psy_drug) <- "Drug abuse"
label(data$mds_psy_drug_notes) <- "Drugs Abused"
label(data$mol_cggrep01) <- "CGG Repeat Size (01)"
label(data$mol_cggrep02) <- "CGG Repeat Size (02)"
label(data$mri_cere_atr) <- "Cerebral Atrophy"
label(data$mri_cere_wm_hyper) <- "Cerebral WM Hyperintensity"
label(data$mri_cerebel_atr) <- "Cerebellar Atrophy"
label(data$mri_cerebel_wm_hyper) <- "Cerebellar WM Hyperintensity"
label(data$mri_corp_call_thick) <- "Corpus Callosum-Thickness"
label(data$mri_genu_wm_hyper) <- "Genu (CC)-WM Hyperintensity"
label(data$mri_mcp_wm_hyper) <- "MCP-WM Hyperintensity"
label(data$mri_peri_wm_hyper) <- "Periventricular WM Hyperintensity"
label(data$mri_pons_wm_hyper) <- "Pons-WM Hyperintensity"
label(data$mri_splen_wm_hyper) <- "Splenium (CC)-WM Hyperintensity"
label(data$mri_subins_wm_hyper) <- "Sub-Insular WM Hyperintensity"
label(data$new_ds_crx1) <- "Current Medications 1"
label(data$new_ds_crx10) <- "Current Medications 10"
label(data$new_ds_crx2) <- "Current Medications 2"
label(data$new_ds_crx3) <- "Current Medications 3"
label(data$new_ds_crx4) <- "Current Medications 4"
label(data$new_ds_crx5) <- "Current Medications 5"
label(data$new_ds_crx6) <- "Current Medications 6"
label(data$new_ds_crx7) <- "Current Medications 7"
label(data$new_ds_crx8) <- "Current Medications 8"
label(data$new_ds_crx9) <- "Current Medications 9"
label(data$new_mds_fxtas_stage) <- "FXTAS Stage (0-5)"
label(data$new_mds_med_ana) <- "ANA positive"
label(data$new_mds_med_anes1) <- "Anesthesia"
label(data$new_mds_med_can_notes) <- "Cancer Notes"
label(data$new_mds_med_can_other) <- "Other Cancer"
label(data$new_mds_med_hyethy) <- "Hyperthyroid"
label(data$new_mds_med_hyothy) <- "Hypothyroid"
label(data$new_mds_med_immun_notes) <- "Immunological Notes"
label(data$new_mds_med_lup) <- "Lupus"
label(data$new_mds_med_mela) <- "Melanoma"
label(data$new_mds_med_mswk) <- "Multiple Sclerosis: Workup"
label(data$new_mds_med_park) <- "Parkinsons"
label(data$new_mds_med_proca) <- "Prostate Cancer"
label(data$new_mds_med_pulm) <- "Pulmonary Fibrosis"
label(data$new_mds_med_ra) <- "Rheumatoid arthritis"
label(data$new_mds_med_ray) <- "Raynauds Syndrome"
label(data$new_mds_med_sjo) <- "Sjogrens Syndrome"
label(data$new_mds_med_skin) <- "Skin Cancer"
label(data$new_mds_med_sur1) <- "Surgery: Type/Age"
label(data$new_mds_med_sur2) <- "Surgery 2: Type/Age"
label(data$new_mds_med_sur3) <- "Surgery 3: Type/Age"
label(data$new_mds_med_sur4) <- "Surgery 4: Type/Age"
label(data$new_mds_med_sur5) <- "Surgery 5: Type/Age"
label(data$new_mds_med_thy) <- "Thyroid problems"
label(data$new_mds_med_thyca) <- "Thyroid Cancer"
label(data$new_mds_ne_ga) <- "Gait ataxia"
label(data$new_mds_ne_gas) <- "Ataxia severity"
label(data$new_mds_ne_pf) <- "parkinsonian features"
label(data$new_mds_ne_pfit) <- "Increased tone"
label(data$new_mds_ne_pfmf) <- "Masked faces"
label(data$new_mds_ne_pfprt) <- "Pill-rolling tremor"
label(data$new_mds_ne_pfsg) <- "Stiff gait"
label(data$new_mds_neu_atax) <- "Walking/ataxia Problems"
label(data$new_mds_neu_atax_age) <- "Age of onset"
label(data$new_mds_neu_trem_age) <- "Tremor age of onset"
label(data$new_mds_neu_trem_age2) <- "Head tremor age of onset"
label(data$new_mds_neu_trem_head) <- "head tremor hx"
label(data$new_mds_neu_trem_int) <- "Intention tremor"
label(data$new_mds_neu_trem_irm) <- "Intermittent tremor hx"
label(data$new_mds_neu_trem_pos) <- "Postural tremor"
label(data$new_mds_neu_trem_rest) <- "Resting tremor"
label(data$new_mds_psy_alco) <- "Alcohol abuse"
label(data$new_mds_psy_dri) <- "# of drinks per day now"
label(data$new_mds_psy_drug) <- "Drug use"
label(data$new_mds_psy_drug_marij) <- "Marijuana use"
label(data$new_mds_psy_drug_notes) <- "Drugs used"
label(data$pp_t1rlb_total) <- "1st Trial Total, R+L+B"
label(data$scid_admin) <- "Was SCID Administered?"
label(data$scid_admin_reason) <- "If no, please give reason"
label(data$scid_dx1age) <- "Interviewers Diagnosis 1, Age of Onset"
label(data$scid_dx2age) <- "Interviewers Diagnosis 2, Age of Onset"
label(data$scid_dx3age) <- "Interviewers Diagnosis 3, Age of Onset"
label(data$scid_dxcode1) <- "Interviewers Diagnosis 1, by Code"
label(data$scid_dxcode2) <- "Interviewers Diagnosis 2, by Code"
label(data$scid_dxcode3) <- "Interviewers Diagnosis 3, by Code"
label(data$scid_md01cur) <- "Bipolar I Disorder (MD01), Current"
label(data$scid_md01lif) <- "Bipolar I Disorder (MD01), Lifetime"
label(data$scid_md02cur) <- "Bipolar II Disorder (MD02), Current"
label(data$scid_md02lif) <- "Bipolar II Disorder (MD02), Lifetime"
label(data$scid_md03cur) <- "Other Bipolar Disorder (MD03), Current"
label(data$scid_md03lif) <- "Other Bipolar Disorder (MD03), Lifetime"
label(data$scid_md04cur) <- "Major Depressive Disorder (MD04), Current"
label(data$scid_md04lif) <- "Major Depressive Disorder (MD04), Lifetime"
label(data$scid_md07cur) <- "Mood Disorder Due to GMC (MD07), Current"
label(data$scid_md07lif) <- "Mood Disorder Due to GMC (MD07), Lifetime"
label(data$scid_md08cur) <- "Substance-Induced Mood Dis. (MD08), Current"
label(data$scid_md08lif) <- "Substance-Induced Mood Dis. (MD08), Lifetime"
label(data$scid_ps01cur) <- "Primary Psychotic Symptoms (PS01), Current"
label(data$scid_ps01lif) <- "Primary Psychotic Symptoms (PS01), Lifetime"
label(data$scl_s_anx_ts) <- "Anxiety (T-score: Nonpatient)"
label(data$scl_s_dep_ts) <- "Depression (T-score: Nonpatient)"
label(data$scl_s_gsi_ts) <- "Global Severity Index (T-score: Nonpatient)"
label(data$scl_s_hos_ts) <- "Hostility (T-score: Nonpatient)"
label(data$scl_s_is_ts) <- "Interpersonal Sensitivity (T-score Nonpatient)"
label(data$scl_s_oc_ts) <- "Obsessive-Compulsive (T-score: Nonpatient)"
label(data$scl_s_par_ts) <- "Paranoid Ideation (T-score: Nonpatient)"
label(data$scl_s_phob_ts) <- "Phobia (T-score: Nonpatient)"
label(data$scl_s_psdi_ts) <- "Positive Symptom Distress Index (T-score: Nonpatient)"
label(data$scl_s_pst_ts) <- "Positive Symptom Total (T-score: Nonpatient)"
label(data$scl_s_psy_ts) <- "Psychoticism (T-score: Nonpatient)"
label(data$scl_s_som_ts) <- "Somatization (T-score: Nonpatient)"
label(data$cantab__swm_between_errors) <- "SWM Between errors"
label(data$cantab__sst_medianrt_gotrials) <- "SST Median correct RT on GO trials"
label(data$cantab_ots_probsolvedfirstchoice_) <- "OTS Problems solved on first choice"
label(data$cantab__rvp_a) <- "RVP A"
label(data$cantab__pal_toterrors_adjusted) <- "PAL Total errors (adjusted)"
label(data$cantab__rti_5choice_movement) <- "RTI Five-choice movement time"
label(data$otspsfc) <- "KEY: OTS Problems Solved on First Choice"
label(data$paltea28) <- "KEY: PAL Total Errors (Adjusted)"
label(data$rtifmdmt) <- "KEY: RTI Median Five-Choice Movement Time"
label(data$sstmrtg) <- "SST Median RT: All Go Trials"
label(data$rvpa) <- "KEY: RVP A (A Prime)"
label(data$swmbe468) <- "KEY: SWM Between Errors"
label(data$bds2_score) <- "BDS-2 Total Score"
label(data$wais_fullscale_iq) <- "Full Scale: IQ Score"
label(data$wais_perf_iq) <- "Performance: IQ Score"
label(data$wais_verb_iq) <- "Verbal: IQ Score"
label(data$wais_iv_perform_2) <- "WAIS IV Working Memory Composite Score (WMI)"
label(data$wais_iv_verbal) <- "WAIS IV Verbal Comprehension Composite Score (VCI)"
label(data$wais_iv_perform) <- "WAIS IV Perceptual Reasoning Composite Score (PRI)"
label(data$wais_iv_perform_3) <- "WAIS IV Processing Speed Composite Score (PSI)"
label(data$wasi_compscore_fsiq4) <- "Composite Score: FSIQ-4"
label(data$wasi_compscore_pri) <- "Composite Score: PRI"
label(data$wasi_compscore_vci) <- "Composite Score: VCI"
label(data$scid_fu_interviewer_diag1) <- "Interviewers Diagnosis 1"
label(data$scid_fu_interviewer_diag2) <- "Interviewers Diagnosis 2"
label(data$scid_fu_interviewer_diag3) <- "Interviewers Diagnosis 3"
label(data$scid_fu_interviewer_diag4) <- "Interviewers Diagnosis 4"
label(data$scid_fu_interviewer_diag5) <- "Interviewers Diagnosis 5"
label(data$scid_fu_interviewer_diag6) <- "Interviewers Diagnosis 6"
label(data$scid_fu_interviewer_diag7) <- "Interviewers Diagnosis 7"
label(data$scid_fu_interviewer_diag8) <- "Interviewers Diagnosis 8"
# Setting Units


# Setting Factors(will create new variable for factors)
data$redcap_event_name.factor <- factor(data$redcap_event_name, levels = c("visit_1_arm_1", "visit_2_arm_1", "visit_3_arm_1", "visit_1_arm_2", "visit_2_arm_2", "visit_3_arm_2", "visit_4_arm_2"))
data$dem_trax_gender.factor <- factor(data$dem_trax_gender, levels = c("0", "1"))
data$dem_trax_race.factor <- factor(data$dem_trax_race, levels = c("1", "2", "3", "4", "5", "6", "7"))
data$dem_trax_eth.factor <- factor(data$dem_trax_eth, levels = c("1", "2", "3"))
data$dem_trax_category.factor <- factor(data$dem_trax_category, levels = c("0", "1"))
data$dem_edlev.factor <- factor(data$dem_edlev, levels = c("1", "2", "3", "4", "5", "6", "7", "8"))
data$mds_med_hyethy.factor <- factor(data$mds_med_hyethy, levels = c("0", "1", "999", "888", "777"))
data$mds_med_hyothy.factor <- factor(data$mds_med_hyothy, levels = c("0", "1", "999", "888", "777"))
data$mds_med_lup.factor <- factor(data$mds_med_lup, levels = c("0", "1", "999", "777"))
data$mds_med_mswk.factor <- factor(data$mds_med_mswk, levels = c("0", "1", "999", "777"))
data$mds_med_proca.factor <- factor(data$mds_med_proca, levels = c("0", "1", "999", "777"))
data$mds_med_ra.factor <- factor(data$mds_med_ra, levels = c("0", "1", "999", "777"))
data$mds_med_ray.factor <- factor(data$mds_med_ray, levels = c("0", "1", "999", "777"))
data$mds_med_sjo.factor <- factor(data$mds_med_sjo, levels = c("0", "1", "999", "777"))
data$mds_med_sur.factor <- factor(data$mds_med_sur, levels = c("0", "1", "999", "777"))
data$mds_med_thy.factor <- factor(data$mds_med_thy, levels = c("0", "1", "999", "777"))
data$mds_med_thyca.factor <- factor(data$mds_med_thyca, levels = c("0", "1", "999", "888", "777"))
data$mds_ne_it.factor <- factor(data$mds_ne_it, levels = c("0", "1", "999", "777"))
data$mds_ne_pfit.factor <- factor(data$mds_ne_pfit, levels = c("0", "1", "999", "777"))
data$mds_ne_pfmf.factor <- factor(data$mds_ne_pfmf, levels = c("0", "1", "999", "777"))
data$mds_ne_pfprt.factor <- factor(data$mds_ne_pfprt, levels = c("0", "1", "999", "777"))
data$mds_ne_pfsg.factor <- factor(data$mds_ne_pfsg, levels = c("0", "1", "999", "777"))
data$mds_ne_pt.factor <- factor(data$mds_ne_pt, levels = c("0", "1", "999", "777"))
data$mds_ne_rt.factor <- factor(data$mds_ne_rt, levels = c("0", "1", "999", "888", "777"))
data$mds_neu_atax.factor <- factor(data$mds_neu_atax, levels = c("0", "1", "999", "888", "777"))
data$mds_neu_trem_irm.factor <- factor(data$mds_neu_trem_irm, levels = c("0", "1", "999", "888", "777"))
data$mds_psy_drug.factor <- factor(data$mds_psy_drug, levels = c("1", "2", "0", "999", "777"))
data$mri_cere_atr.factor <- factor(data$mri_cere_atr, levels = c("0", "1", "3", "4", "999"))
data$mri_cere_wm_hyper.factor <- factor(data$mri_cere_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_cerebel_atr.factor <- factor(data$mri_cerebel_atr, levels = c("0", "1", "3", "4", "999"))
data$mri_cerebel_wm_hyper.factor <- factor(data$mri_cerebel_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_corp_call_thick.factor <- factor(data$mri_corp_call_thick, levels = c("0", "1", "999"))
data$mri_genu_wm_hyper.factor <- factor(data$mri_genu_wm_hyper, levels = c("0", "1", "999"))
data$mri_mcp_wm_hyper.factor <- factor(data$mri_mcp_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_peri_wm_hyper.factor <- factor(data$mri_peri_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_pons_wm_hyper.factor <- factor(data$mri_pons_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_splen_wm_hyper.factor <- factor(data$mri_splen_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$mri_subins_wm_hyper.factor <- factor(data$mri_subins_wm_hyper, levels = c("0", "1", "3", "4", "999"))
data$new_mds_med_ana.factor <- factor(data$new_mds_med_ana, levels = c("0", "1", "3", "999", "888", "777"))
data$new_mds_med_anes1.factor <- factor(data$new_mds_med_anes1, levels = c("2", "3", "0", "999", "888", "777"))
data$new_mds_med_can_other.factor <- factor(data$new_mds_med_can_other, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_hyethy.factor <- factor(data$new_mds_med_hyethy, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_hyothy.factor <- factor(data$new_mds_med_hyothy, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_lup.factor <- factor(data$new_mds_med_lup, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_mela.factor <- factor(data$new_mds_med_mela, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_mswk.factor <- factor(data$new_mds_med_mswk, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_park.factor <- factor(data$new_mds_med_park, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_proca.factor <- factor(data$new_mds_med_proca, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_pulm.factor <- factor(data$new_mds_med_pulm, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_ra.factor <- factor(data$new_mds_med_ra, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_ray.factor <- factor(data$new_mds_med_ray, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_sjo.factor <- factor(data$new_mds_med_sjo, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_skin.factor <- factor(data$new_mds_med_skin, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_thy.factor <- factor(data$new_mds_med_thy, levels = c("0", "1", "999", "888", "777"))
data$new_mds_med_thyca.factor <- factor(data$new_mds_med_thyca, levels = c("0", "1", "999", "888", "777"))
data$new_mds_ne_ga.factor <- factor(data$new_mds_ne_ga, levels = c("0", "1", "999", "777"))
data$new_mds_ne_pf.factor <- factor(data$new_mds_ne_pf, levels = c("0", "1", "999", "777"))
data$new_mds_ne_pfit.factor <- factor(data$new_mds_ne_pfit, levels = c("0", "1", "999", "777"))
data$new_mds_ne_pfmf.factor <- factor(data$new_mds_ne_pfmf, levels = c("0", "1", "999", "777"))
data$new_mds_ne_pfprt.factor <- factor(data$new_mds_ne_pfprt, levels = c("0", "1", "999", "777"))
data$new_mds_ne_pfsg.factor <- factor(data$new_mds_ne_pfsg, levels = c("0", "1", "999", "777"))
data$new_mds_neu_atax.factor <- factor(data$new_mds_neu_atax, levels = c("0", "1", "999", "888", "777"))
data$new_mds_neu_trem_head.factor <- factor(data$new_mds_neu_trem_head, levels = c("0", "1", "999", "888", "777"))
data$new_mds_neu_trem_int.factor <- factor(data$new_mds_neu_trem_int, levels = c("0", "1", "999", "888", "777"))
data$new_mds_neu_trem_irm.factor <- factor(data$new_mds_neu_trem_irm, levels = c("0", "1", "999", "888", "777"))
data$new_mds_neu_trem_pos.factor <- factor(data$new_mds_neu_trem_pos, levels = c("0", "1", "999", "888", "777"))
data$new_mds_neu_trem_rest.factor <- factor(data$new_mds_neu_trem_rest, levels = c("0", "1", "999", "888", "777"))
data$new_mds_psy_alco.factor <- factor(data$new_mds_psy_alco, levels = c("0", "1", "2", "999", "888", "777"))
data$new_mds_psy_drug.factor <- factor(data$new_mds_psy_drug, levels = c("0", "1", "2", "999", "888", "777"))
data$new_mds_psy_drug_marij.factor <- factor(data$new_mds_psy_drug_marij, levels = c("0", "1", "2", "999", "888", "777"))
data$scid_admin.factor <- factor(data$scid_admin, levels = c("1", "0"))
data$scid_dxcode1.factor <- factor(data$scid_dxcode1, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "10", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "44", "777", "888", "999"))
data$scid_dxcode2.factor <- factor(data$scid_dxcode2, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "10", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "44", "777", "888", "999"))
data$scid_dxcode3.factor <- factor(data$scid_dxcode3, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "10", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "44", "777", "888", "999"))
data$scid_md01cur.factor <- factor(data$scid_md01cur, levels = c("1", "3"))
data$scid_md01lif.factor <- factor(data$scid_md01lif, levels = c("777", "1", "2", "3"))
data$scid_md02cur.factor <- factor(data$scid_md02cur, levels = c("1", "3"))
data$scid_md02lif.factor <- factor(data$scid_md02lif, levels = c("777", "1", "2", "3"))
data$scid_md03cur.factor <- factor(data$scid_md03cur, levels = c("1", "3"))
data$scid_md03lif.factor <- factor(data$scid_md03lif, levels = c("777", "1", "2", "3"))
data$scid_md04cur.factor <- factor(data$scid_md04cur, levels = c("1", "3"))
data$scid_md04lif.factor <- factor(data$scid_md04lif, levels = c("777", "1", "2", "3"))
data$scid_md07cur.factor <- factor(data$scid_md07cur, levels = c("1", "3"))
data$scid_md07lif.factor <- factor(data$scid_md07lif, levels = c("777", "1", "2", "3"))
data$scid_md08cur.factor <- factor(data$scid_md08cur, levels = c("1", "3"))
data$scid_md08lif.factor <- factor(data$scid_md08lif, levels = c("777", "1", "2", "3"))
data$scid_ps01cur.factor <- factor(data$scid_ps01cur, levels = c("1", "3"))
data$scid_ps01lif.factor <- factor(data$scid_ps01lif, levels = c("777", "1", "2", "3"))

levels(data$redcap_event_name.factor) <- c("Visit 1 (Arm 1: Phase 1)", "Visit 2 (Arm 1: Phase 1)", "Visit 3 (Arm 1: Phase 1)", "Visit 1 (Arm 2: Phase 2)", "Visit 2 (Arm 2: Phase 2)", "Visit 3 (Arm 2: Phase 2)", "Visit 4 (Arm 2: Phase 2)")
levels(data$dem_trax_gender.factor) <- c("Female", "Male")
levels(data$dem_trax_race.factor) <- c("American Indian/Alaska Native", "Asian", "Native Hawaiian or Other Pacific Islander", "Black or African American", "White", "More Than One Race", "Unknown / Not Reported")
levels(data$dem_trax_eth.factor) <- c("Hispanic or Latino", "Not Hispanic or Latino", "Unknown / Not Reported")
levels(data$dem_trax_category.factor) <- c("Control", "Premutation")
levels(data$dem_edlev.factor) <- c("K-7", "8-9", "10-11", "High School/GED", "Partial College", "BA/BS", "MA/MS/PhD/MD", "No Data")
levels(data$mds_med_hyethy.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_med_hyothy.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_med_lup.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_mswk.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_proca.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_ra.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_ray.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_sjo.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_sur.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_thy.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_med_thyca.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_ne_it.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_pfit.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_pfmf.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_pfprt.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_pfsg.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_pt.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$mds_ne_rt.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_neu_atax.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_neu_trem_irm.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$mds_psy_drug.factor) <- c("Past Only", "Present", "None", "no response", "question not asked at time of data entry; check records")
levels(data$mri_cere_atr.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_cere_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_cerebel_atr.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_cerebel_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_corp_call_thick.factor) <- c("Normal", "Thin", "Missing/Refused")
levels(data$mri_genu_wm_hyper.factor) <- c("No", "Yes", "Missing/Refused")
levels(data$mri_mcp_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_peri_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_pons_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_splen_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$mri_subins_wm_hyper.factor) <- c("None", "Mild", "Moderate", "Severe", "Missing/Refused")
levels(data$new_mds_med_ana.factor) <- c("No", "Yes", "Unknown", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_anes1.factor) <- c("Local", "General", "None", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_can_other.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_hyethy.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_hyothy.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_lup.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_mela.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_mswk.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_park.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_proca.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_pulm.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_ra.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_ray.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_sjo.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_skin.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_thy.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_med_thyca.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_ga.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_pf.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_pfit.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_pfmf.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_pfprt.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_ne_pfsg.factor) <- c("No", "Yes", "No Response", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_atax.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_trem_head.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_trem_int.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_trem_irm.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_trem_pos.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_neu_trem_rest.factor) <- c("No", "Yes", "No Response", "NA", "Question not asked at time of data entry; check records")
levels(data$new_mds_psy_alco.factor) <- c("None", "Past Only", "Present", "no response", "NA", "question not asked at time of data entry; check records")
levels(data$new_mds_psy_drug.factor) <- c("None", "Past Only", "Present", "no response", "NA", "question not asked at time of data entry; check records")
levels(data$new_mds_psy_drug_marij.factor) <- c("None", "Past Only", "Present", "no response", "NA", "question not asked at time of data entry; check records")
levels(data$scid_admin.factor) <- c("Yes", "No")
levels(data$scid_dxcode1.factor) <- c("Bipolar I Disorder (MD01)", "Bipolar II Disorder (MD02)", "Other Bipolar Disorder (MD03)", "Major Depressive Disorder (MD04)", "Dysthymic Disorder (MD05), Lifetime", "Depressive Disorder NOS (MD06)", "Mood Disorder Due to GMC (MD07)", "Substance-Induced Mood Disorder (MD08)", "Primary Psychotic Symptom (PS01)", "Alcohol (SUD17)", "Sedative-Hypnotic-Anxioly (SUD18)", "Cannabis (SUD19)", "Stimulants (SUD20)", "Opioid (SUD21)", "Cocaine (SUD22)", "Hallucinogenics/ PCP (SUD23)", "Poly Drug (SUD24)", "Substance Abuse Other (SUD25)", "Panic Disorder (ANX26)", "Agoraphobia without Panic (ANX27)", "Social Phobia (ANX28)", "Specific Phobia (ANX29)", "Obsessive Compulsive (ANX30)", "Posttraumatic Stress (ANX31)", "Generalized Anxiety (ANX32)", "Anxiety Due to GMC (ANX33)", "Substance-Induced Anxiety (ANX34)", "Anxiety Disorder NOS (ANX35)", "Somatization Disorder (SOM36)", "Pain Disorder (SOM37)", "Undifferentiated Somatoform (SOM38)", "Hypochondriasis (SOM39)", "Body Dysmorphic (SOM40)", "Adjustment Disorder (ADJ44)", "Other Dx Not Listed", "Not Applicable", "None Listed or Incomplete Data")
levels(data$scid_dxcode2.factor) <- c("Bipolar I Disorder (MD01)", "Bipolar II Disorder (MD02)", "Other Bipolar Disorder (MD03)", "Major Depressive Disorder (MD04)", "Dysthymic Disorder (MD05), Lifetime", "Depressive Disorder NOS (MD06)", "Mood Disorder Due to GMC (MD07)", "Substance-Induced Mood Disorder (MD08)", "Primary Psychotic Symptom (PS01)", "Alcohol (SUD17)", "Sedative-Hypnotic-Anxioly (SUD18)", "Cannabis (SUD19)", "Stimulants (SUD20)", "Opioid (SUD21)", "Cocaine (SUD22)", "Hallucinogenics/ PCP (SUD23)", "Poly Drug (SUD24)", "Substance Abuse Other (SUD25)", "Panic Disorder (ANX26)", "Agoraphobia without Panic (ANX27)", "Social Phobia (ANX28)", "Specific Phobia (ANX29)", "Obsessive Compulsive (ANX30)", "Posttraumatic Stress (ANX31)", "Generalized Anxiety (ANX32)", "Anxiety Due to GMC (ANX33)", "Substance-Induced Anxiety (ANX34)", "Anxiety Disorder NOS (ANX35)", "Somatization Disorder (SOM36)", "Pain Disorder (SOM37)", "Undifferentiated Somatoform (SOM38)", "Hypochondriasis (SOM39)", "Body Dysmorphic (SOM40)", "Adjustment Disorder (ADJ44)", "Other Dx Not Listed", "Not Applicable", "None Listed or Incomplete Data")
levels(data$scid_dxcode3.factor) <- c("Bipolar I Disorder (MD01)", "Bipolar II Disorder (MD02)", "Other Bipolar Disorder (MD03)", "Major Depressive Disorder (MD04)", "Dysthymic Disorder (MD05), Lifetime", "Depressive Disorder NOS (MD06)", "Mood Disorder Due to GMC (MD07)", "Substance-Induced Mood Disorder (MD08)", "Primary Psychotic Symptom (PS01)", "Alcohol (SUD17)", "Sedative-Hypnotic-Anxioly (SUD18)", "Cannabis (SUD19)", "Stimulants (SUD20)", "Opioid (SUD21)", "Cocaine (SUD22)", "Hallucinogenics/ PCP (SUD23)", "Poly Drug (SUD24)", "Substance Abuse Other (SUD25)", "Panic Disorder (ANX26)", "Agoraphobia without Panic (ANX27)", "Social Phobia (ANX28)", "Specific Phobia (ANX29)", "Obsessive Compulsive (ANX30)", "Posttraumatic Stress (ANX31)", "Generalized Anxiety (ANX32)", "Anxiety Due to GMC (ANX33)", "Substance-Induced Anxiety (ANX34)", "Anxiety Disorder NOS (ANX35)", "Somatization Disorder (SOM36)", "Pain Disorder (SOM37)", "Undifferentiated Somatoform (SOM38)", "Hypochondriasis (SOM39)", "Body Dysmorphic (SOM40)", "Adjustment Disorder (ADJ44)", "Other Dx Not Listed", "Not Applicable", "None Listed or Incomplete Data")
levels(data$scid_md01cur.factor) <- c("Absent", "Present")
levels(data$scid_md01lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_md02cur.factor) <- c("Absent", "Present")
levels(data$scid_md02lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_md03cur.factor) <- c("Absent", "Present")
levels(data$scid_md03lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_md04cur.factor) <- c("Absent", "Present")
levels(data$scid_md04lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_md07cur.factor) <- c("Absent", "Present")
levels(data$scid_md07lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_md08cur.factor) <- c("Absent", "Present")
levels(data$scid_md08lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
levels(data$scid_ps01cur.factor) <- c("Absent", "Present")
levels(data$scid_ps01lif.factor) <- c("Inadequate Info", "Absent", "Sub-Threshold", "Threshold")
