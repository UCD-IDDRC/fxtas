# results are consistent

    Code
      dplyr::glimpse(results)
    Output
      List of 16
       $ samples_sequence       : 'samples_sequence' chr [1:3, 1:15, 1:100000] "Biomarker 2: 1" "Biomarker 5: 1" "Biomarker 4: 1" "Biomarker 1: 1" ...
        ..- attr(*, "subtype_order")= int [1:3] 1 2 3
        ..- attr(*, "dimnames")=List of 3
        .. ..$ subtype  : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position : chr [1:15] "1" "2" "3" "4" ...
        .. ..$ iteration: NULL
       $ samples_f              : 'samples_f' num [1:3, 1:100000] 0.177 0.23 0.593 0.177 0.23 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype  : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ iteration: NULL
       $ samples_likelihood     : num [1:100000, 1] -94 -94 -94 -94 -96.7 ...
       $ ml_subtype             : Factor w/ 4 levels "Type 0","Type 1",..: 2 1 2 2 2 2 2 2 2 2 ...
        ..- attr(*, "n_s")= int 3
       $ prob_ml_subtype        : num [1:20, 1] 0.968 0.695 0.973 0.973 0.973 ...
       $ ml_stage               : num [1:20, 1] 8 0 6 6 6 10 11 10 10 7 ...
       $ prob_ml_stage          : num [1:20, 1] 0.673 0.303 0.763 0.763 0.763 ...
       $ prob_subtype           : 'prob_subtype' num [1:20, 1:3] 0.968 0.695 0.973 0.973 0.973 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ ID     : NULL
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ prob_stage             : num [1:20, 1:16] 0.000141 0.907681 0.000058 0.000058 0.000058 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ ID   : NULL
        .. ..$ Stage: chr [1:16] "Stage 0" "Stage 1" "Stage 2" "Stage 3" ...
       $ prob_subtype_stage     : num [1:20, 1:16, 1:3] 8.42e-05 3.03e-01 3.68e-05 3.68e-05 3.68e-05 ...
        ..- attr(*, "dimnames")=List of 3
        .. ..$ ID     : NULL
        .. ..$ Stage  : chr [1:16] "Stage 0" "Stage 1" "Stage 2" "Stage 3" ...
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ ml_sequence_EM         : num [1:3, 1:15] 1 4 3 0 9 8 3 1 1 2 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position: NULL
       $ ml_sequence_prev_EM    : num [1:3, 1:15] 1 4 3 0 9 8 3 1 1 2 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position: NULL
       $ ml_f_EM                : 'ml_f_EM' num [1:3(1d)] 0.177 0.23 0.593
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ ml_f_prev_EM           : 'ml_f_EM' num [1:3(1d)] 0.177 0.23 0.593
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ subtype_and_stage_table: tibble [20 x 5] (S3: tbl_df/tbl/data.frame)
        ..$ ml_subtype     : Factor w/ 4 levels "Type 0","Type 1",..: 2 1 2 2 2 2 2 2 2 2 ...
        .. ..- attr(*, "n_s")= int 3
        ..$ ml_stage       : num [1:20] 8 0 6 6 6 10 11 10 10 7 ...
        ..$ prob_ml_subtype: num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
        ..$ prob_ml_stage  : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
        ..$ ml_subtype_old : num [1:20] 1 0 1 1 1 1 1 1 1 1 ...
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "1" "2" "3"
       $ ml_subtype_old         : num [1:20] 0 0 0 0 0 0 0 0 0 0 ...
       - attr(*, "class")= chr [1:2] "SuStaIn_model" "list"
       - attr(*, "n_s")= int 3
       - attr(*, "biomarker_groups")= tibble [5 x 3] (S3: tbl_df/tbl/data.frame)
        ..$ biomarker      : chr [1:5] "Biomarker 1" "Biomarker 2" "Biomarker 3" "Biomarker 4" ...
        ..$ biomarker_group: chr [1:5] "group 1" "group 1" "group 2" "group 2" ...
        ..$ group_color    : chr [1:5] "#C87A8A" "#C87A8A" "#6B9D59" "#6B9D59" ...
       - attr(*, "biomarker_levels")=List of 5
        ..$ Biomarker 1: int [1:4] 0 1 2 3
        ..$ Biomarker 2: int [1:4] 0 1 2 3
        ..$ Biomarker 3: int [1:4] 0 1 2 3
        ..$ Biomarker 4: int [1:4] 0 1 2 3
        ..$ Biomarker 5: int [1:4] 0 1 2 3

---

    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
    AAAIbWxfc3RhZ2UABAAJAAAADXByb2JfbWxfc3RhZ2UABAAJAAAADHByb2Jfc3VidHlwZQAE
    AAkAAAAKcHJvYl9zdGFnZQAEAAkAAAAScHJvYl9zdWJ0eXBlX3N0YWdlAAQACQAAAA5tbF9z
    ZXF1ZW5jZV9FTQAEAAkAAAATbWxfc2VxdWVuY2VfcHJldl9FTQAEAAkAAAAHbWxfZl9FTQAE
    AAkAAAAMbWxfZl9wcmV2X0VNAAQACQAAABdzdWJ0eXBlX2FuZF9zdGFnZV90YWJsZQAEAAkA
    AAAObWxfc3VidHlwZV9vbGQAAAQCAAAC/wAAABAAAAACAAQACQAAAA1TdVN0YUluX21vZGVs
    AAQACQAAAARsaXN0AAAEAgAAA/8AAAANAAAAAQAAAAMAAAQCAAAAAQAEAAkAAAAQYmlvbWFy
    a2VyX2dyb3VwcwAAAxMAAAADAAAAEAAAAAUABAAJAAAAC0Jpb21hcmtlciAxAAQACQAAAAtC
    aW9tYXJrZXIgMgAEAAkAAAALQmlvbWFya2VyIDMABAAJAAAAC0Jpb21hcmtlciA0AAQACQAA
    AAtCaW9tYXJrZXIgNQAAABAAAAAFAAQACQAAAAdncm91cCAxAAQACQAAAAdncm91cCAxAAQA
    CQAAAAdncm91cCAyAAQACQAAAAdncm91cCAyAAQACQAAAAdncm91cCAzAAAAEAAAAAUABAAJ
    AAAAByNDODdBOEEABAAJAAAAByNDODdBOEEABAAJAAAAByM2QjlENTkABAAJAAAAByM2QjlE
    NTkABAAJAAAAByM1Rjk2QzIAAAQCAAAG/wAAABAAAAADAAQACQAAAAliaW9tYXJrZXIABAAJ
    AAAAD2Jpb21hcmtlcl9ncm91cAAEAAkAAAALZ3JvdXBfY29sb3IAAAQCAAAH/wAAAA0AAAAC
    gAAAAP////sAAAQCAAAC/wAAABAAAAADAAQACQAAAAZ0YmxfZGYABAAJAAAAA3RibAAEAAkA
    AAAKZGF0YS5mcmFtZQAAAP4AAAQCAAAAAQAEAAkAAAAQYmlvbWFya2VyX2xldmVscwAAAhMA
    AAAFAAAADQAAAAQAAAAAAAAAAQAAAAIAAAADAAAADQAAAAQAAAAAAAAAAQAAAAIAAAADAAAA
    DQAAAAQAAAAAAAAAAQAAAAIAAAADAAAADQAAAAQAAAAAAAAAAQAAAAIAAAADAAAADQAAAAQA
    AAAAAAAAAQAAAAIAAAADAAAEAgAABv8AAAAQAAAABQAEAAkAAAALQmlvbWFya2VyIDEABAAJ
    AAAAC0Jpb21hcmtlciAyAAQACQAAAAtCaW9tYXJrZXIgMwAEAAkAAAALQmlvbWFya2VyIDQA
    BAAJAAAAC0Jpb21hcmtlciA1AAAA/gAAAP4=

# results are consistent with custom ordering

    Code
      dplyr::glimpse(results)
    Output
      List of 16
       $ samples_sequence       : 'samples_sequence' chr [1:3, 1:15, 1:100000] "Biomarker 4: 1" "Biomarker 2: 1" "Biomarker 5: 1" "Biomarker 4: 2" ...
        ..- attr(*, "subtype_order")= num [1:3] 3 1 2
        ..- attr(*, "dimnames")=List of 3
        .. ..$ subtype  : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position : chr [1:15] "1" "2" "3" "4" ...
        .. ..$ iteration: NULL
       $ samples_f              : 'samples_f' num [1:3, 1:100000] 0.593 0.177 0.23 0.593 0.177 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype  : chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
        .. ..$ iteration: NULL
       $ samples_likelihood     : num [1:100000, 1] -94 -94 -94 -94 -96.7 ...
       $ ml_subtype             : Factor w/ 4 levels "Type 0","Type 1",..: 3 1 3 3 3 3 3 3 3 3 ...
        ..- attr(*, "n_s")= int 3
       $ prob_ml_subtype        : num [1:20, 1] 0.968 0.695 0.973 0.973 0.973 ...
       $ ml_stage               : num [1:20, 1] 8 0 6 6 6 10 11 10 10 7 ...
       $ prob_ml_stage          : num [1:20, 1] 0.673 0.303 0.763 0.763 0.763 ...
       $ prob_subtype           : 'prob_subtype' num [1:20, 1:3] 0.0155 0.1524 0.0141 0.0141 0.0141 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ ID     : NULL
        .. ..$ subtype: chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
       $ prob_stage             : num [1:20, 1:16] 0.000141 0.907681 0.000058 0.000058 0.000058 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ ID   : NULL
        .. ..$ Stage: chr [1:16] "Stage 0" "Stage 1" "Stage 2" "Stage 3" ...
       $ prob_subtype_stage     : num [1:20, 1:16, 1:3] 8.42e-05 3.03e-01 3.68e-05 3.68e-05 3.68e-05 ...
        ..- attr(*, "dimnames")=List of 3
        .. ..$ ID     : NULL
        .. ..$ Stage  : chr [1:16] "Stage 0" "Stage 1" "Stage 2" "Stage 3" ...
        .. ..$ subtype: chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
       $ ml_sequence_EM         : num [1:3, 1:15] 1 4 3 0 9 8 3 1 1 2 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
        .. ..$ position: NULL
       $ ml_sequence_prev_EM    : num [1:3, 1:15] 1 4 3 0 9 8 3 1 1 2 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
        .. ..$ position: NULL
       $ ml_f_EM                : 'ml_f_EM' num [1:3(1d)] 0.593 0.177 0.23
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
       $ ml_f_prev_EM           : 'ml_f_EM' num [1:3(1d)] 0.593 0.177 0.23
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 3" "Subtype 1" "Subtype 2"
       $ subtype_and_stage_table: tibble [20 x 5] (S3: tbl_df/tbl/data.frame)
        ..$ ml_subtype     : Factor w/ 4 levels "Type 0","Type 1",..: 3 1 3 3 3 3 3 3 3 3 ...
        .. ..- attr(*, "n_s")= int 3
        ..$ ml_stage       : num [1:20] 8 0 6 6 6 10 11 10 10 7 ...
        ..$ prob_ml_subtype: num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
        ..$ prob_ml_stage  : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
        ..$ ml_subtype_old : num [1:20] 1 0 1 1 1 1 1 1 1 1 ...
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "3" "1" "2"
       $ ml_subtype_old         : num [1:20] 0 0 0 0 0 0 0 0 0 0 ...
       - attr(*, "class")= chr [1:2] "SuStaIn_model" "list"
       - attr(*, "n_s")= int 3
       - attr(*, "biomarker_groups")= tibble [5 x 3] (S3: tbl_df/tbl/data.frame)
        ..$ biomarker      : chr [1:5] "Biomarker 1" "Biomarker 2" "Biomarker 3" "Biomarker 4" ...
        ..$ biomarker_group: chr [1:5] "group 1" "group 1" "group 2" "group 2" ...
        ..$ group_color    : chr [1:5] "#C87A8A" "#C87A8A" "#6B9D59" "#6B9D59" ...
       - attr(*, "biomarker_levels")=List of 5
        ..$ Biomarker 1: int [1:4] 0 1 2 3
        ..$ Biomarker 2: int [1:4] 0 1 2 3
        ..$ Biomarker 3: int [1:4] 0 1 2 3
        ..$ Biomarker 4: int [1:4] 0 1 2 3
        ..$ Biomarker 5: int [1:4] 0 1 2 3

