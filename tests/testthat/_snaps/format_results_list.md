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
       $ ml_subtype             : Factor w/ 4 levels "Type 0","Type 1",..: 4 1 4 4 4 4 4 4 4 4 ...
        ..- attr(*, "n_s")= int 3
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "2" "3" "1"
       $ prob_ml_subtype        : num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
       $ ml_stage               : num [1:20, 1] 8 0 6 6 6 10 11 10 10 7 ...
       $ prob_ml_stage          : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
       $ prob_subtype           : 'prob_subtype' num [1:20, 1:3] 0.0166 0.153 0.0132 0.0132 0.0132 ...
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
       $ subtype_and_stage_table: tibble [20 x 6] (S3: tbl_df/tbl/data.frame)
        ..$ ml_subtype     : Factor w/ 4 levels "Type 0","Type 1",..: 4 1 4 4 4 4 4 4 4 4 ...
        .. ..- attr(*, "n_s")= int 3
        ..$ ml_stage       : num [1:20] 8 0 6 6 6 10 11 10 10 7 ...
        ..$ prob_ml_subtype: num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
        ..$ prob_ml_stage  : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
        ..$ prob_subtype   : num [1:20, 1:3] 0.0166 0.153 0.0132 0.0132 0.0132 ...
        ..$ ml_subtype_old : num [1:20] 1 0 1 1 1 1 1 1 1 1 ...
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "2" "3" "1"
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
       - attr(*, "subtype_order")= int [1:3] 1 2 3
       - attr(*, "ix")= int [1:3] 3 1 2

---

    WAoAAAACAAQFAQACAwAAAAMTAAAADQAAAw0AAAAUAAAABAAAAAEAAAAEAAAABAAAAAQAAAAE
    AAAABAAAAAQAAAAEAAAABAAAAAEAAAAEAAAABAAAAAIAAAAEAAAABAAAAAQAAAAEAAAABAAA
    AAQAAAQCAAAAAQAEAAkAAAAGbGV2ZWxzAAAAEAAAAAQABAAJAAAABlR5cGUgMAAEAAkAAAAG
    VHlwZSAxAAQACQAAAAZUeXBlIDIABAAJAAAABlR5cGUgMwAABAIAAAABAAQACQAAAAVjbGFz
    cwAAABAAAAABAAQACQAAAAZmYWN0b3IAAAQCAAAAAQAEAAkAAAADbl9zAAAADQAAAAEAAAAD
    AAAEAgAAAAEABAAJAAAAC3N1YnR5cGVfbWFwAAACDQAAAAQAAAAAAAAAAQAAAAIAAAADAAAE
    AgAAAAEABAAJAAAABW5hbWVzAAAAEAAAAAQABAAJAAAAATAABAAJAAAAATIABAAJAAAAATMA
    BAAJAAAAATEAAAD+AAAA/gAAAA4AAAAUP+75BobJ0lM/5jrdhEoYbD/vH+Ahhnq8P+8f4CGG
    erw/7x/gIYZ6vD/WYdSg7hb6P9voRbF+0bo/4bdgA/6Ywj/esXouRkSpP+8XyT1ZvIs/5jrd
    hEoYbD/vH+Ahhnq8P+8f4CGGerw/2tch9TRr3j/WkpmbYAWTP9aSmZtgBZM/7vkGhsnSUz/u
    +QaGydJTP+InKyOwQL8/5LoBLbfuOQAAAg4AAAAUQCAAAAAAAAAAAAAAAAAAAEAYAAAAAAAA
    QBgAAAAAAABAGAAAAAAAAEAkAAAAAAAAQCYAAAAAAABAJAAAAAAAAEAkAAAAAAAAQBwAAAAA
    AAAAAAAAAAAAAEAYAAAAAAAAQBgAAAAAAABAGAAAAAAAAEAiAAAAAAAAQCIAAAAAAABAIAAA
    AAAAAEAgAAAAAAAAQBQAAAAAAABAFAAAAAAAAAAABAIAAAABAAQACQAAAANkaW0AAAANAAAA
    AgAAABQAAAABAAAA/gAAAA4AAAAUP+WJv8eMWDo/014tph85wD/oaIpBfNXSP+hoikF81dI/
    6GiKQXzV0j+3IDcq5PAtP799fnySk/s/xkTDc10lzj/A2kjgeewjP+EINwi3QdE/014tph85
    wD/oaIpBfNXSP+hoikF81dI/ykckoyPBej+x9qa3t1AZP7H2pre3UBk/5Ym/x4xYOj/lib/H
    jFg6P8yQe7QIUEM/xnVBbiBE2QAAAw4AAAA8P5D/RRx33Pg/w5P2lRdOFz+LH8c/cGweP4sf
    xz9wbB4/ix/HP3BsHj/UCFdn695vP9JRdE3IlFM/zTRb9sS3Cj/Qn0dxGpVMP48Y2Ub1iRE/
    w5P2lRdOFz+LH8c/cGweP4sfxz9wbB4/2tch9TRr3j/UstEN2xS8P9Sy0Q3bFLw/kP9FHHfc
    +D+Q/0Ucd9z4P8xJbiNlj40/xjwxVzlnSD+Pv9QUm7HZP8OAk1nAUCo/jOgwXvDk0j+M6DBe
    8OTSP4zoMF7w5NI/1ZXT9yYKvj/RxkYAuJoKP8vuI/lA5as/0K8+YJ8mBj+K9Ndim1QIP8OA
    k1nAUCo/jOgwXvDk0j+M6DBe8OTSP9iuT6kk1OY/1LqVVsTluT/UupVWxOW5P4+/1BSbsdk/
    j7/UFJux2T/LGeVN2W18P8bbyfHm3/I/7vkGhsnSUz/mOt2EShhsP+8f4CGGerw/7x/gIYZ6
    vD/vH+Ahhnq8P9Zh1KDuFvo/2+hFsX7Ruj/ht2AD/pjCP96xei5GRKk/7xfJPVm8iz/mOt2E
    ShhsP+8f4CGGerw/7x/gIYZ6vD/I9RzDTX58P9aSmZtgBZM/1pKZm2AFkz/u+QaGydJTP+75
    BobJ0lM/4icrI7BAvz/kugEtt+45AAAEAgAABv8AAAANAAAAAgAAABQAAAADAAAEAgAAAAEA
    BAAJAAAACGRpbW5hbWVzAAACEwAAAAIAAAD+AAAAEAAAAAMABAAJAAAACVN1YnR5cGUgMQAE
    AAkAAAAJU3VidHlwZSAyAAQACQAAAAlTdWJ0eXBlIDMAAAQCAAAF/wAAABAAAAACAAQACQAA
    AAJJRAAEAAkAAAAHc3VidHlwZQAAAP4AAAQCAAAC/wAAABAAAAADAAQACQAAAAxwcm9iX3N1
    YnR5cGUABAAJAAAABm1hdHJpeAAEAAkAAAAFYXJyYXkAAAD+AAACDgAAAUA/In5vfwXIwT/t
    C7johNi/Pw5tVtbdw9M/Dm1W1t3D0z8ObVbW3cPTPxYkN1oxVmk/AVYIoqK8nD9Ou//D7dgl
    P0DePsn4Pqs/I62bFTRJXD/tC7johNi/Pw5tVtbdw9M/Dm1W1t3D0z8h6IyScaCTP0pYug6q
    fmw/Sli6Dqp+bD8ifm9/BcjBPyJ+b38FyME/HFQfUGrnkj9OVM02v3W3PzudHjil79A/s10l
    8FiQij80UuzD/ElgPzRS7MP8SWA/NFLsw/xJYD83ltAwzo7sPwYxtDt8HUw/cQ3YIEKFdT9A
    eqswfa/vP0pULaCPD9M/s10l8FiQij80UuzD/ElgPzRS7MP8SWA/VftYbMuj7z9pbI+2IzJR
    P2lsj7YjMlE/O50eOKXv0D87nR44pe/QP1AsBul2Rbk/ef1DKe/snT9JF5rOzEURP4u3203Y
    95g/VRv1xpP6/z9VG/XGk/r/P1Ub9caT+v8/SdQVfqX9ij8TPkeSEWWnP3k4J88WFcc/S26F
    YPs06T9pQ9VnerpLP4u3203Y95g/VRv1xpP6/z9VG/XGk/r/P4SkmosKsIw/dhgwxImFwz92
    GDDEiYXDP0kXms7MRRE/SReazsxFET980qeBteBiP5tTRxNT6PQ/YMHH+d3mxD9jYMr3g12d
    P26MEVmm778/bowRWabvvz9ujBFZpu+/P1/F1yL9PP4/JR9QYHM6Zj+DS+ccUV33P1oJcJQS
    3S8/gMOKni3sTz9jYMr3g12dP26MEVmm778/bowRWabvvz+ofxb1brkPP4/VevsHF4s/j9V6
    +wcXiz9gwcf53ebEP2DBx/nd5sQ/o4IWMi+Kuz+sZqd+Ny7YP3Ix83WPbCk/PyemRZBKxT+S
    y1eTVJ0KP5LLV5NUnQo/kstXk1SdCj9zfUSlKAsxPzYD1GwATn8/jWjbILokzj9o2DfiVWkv
    P5yzjt5RBKk/PyemRZBKxT+Sy1eTVJ0KP5LLV5NUnQo/vQAGAGxvhz+dx4kRIA71P53HiREg
    DvU/cjHzdY9sKT9yMfN1j2wpP7/zZ4Y6D6U/wqdf9tDM1D+G682SVBeWPx6EuJBsOxA/ssXT
    C6du1j+yxdMLp27WP7LF0wunbtY/iEI8F0F0Az9KP+zBpTF4P59t1PTdSt0/eLhbHyIrQD+2
    /ZuT8/qyPx6EuJBsOxA/ssXTC6du1j+yxdMLp27WP8dpmvlnVug/r2CBimPLKT+vYIGKY8sp
    P4brzZJUF5Y/huvNklQXlj/dCXbBqFWRP9Npt5qld3o/kvjto7Bq5z8IjUxAUDkrP+pan1R/
    Yss/6lqfVH9iyz/qWp9Uf2LLP50rX3vzusU/Y7VJ1pODSj+xsFYZUv33P5RsAwMJekE/yGCg
    tYv65z8IjUxAUDkrP+pan1R/Yss/6lqfVH9iyz/XmJ/BZCWNP7EkM8aIEps/sSQzxogSmz+S
    +O2jsGrnP5L47aOwauc/0JpELP0zuz/MsX9rqKryP8VboWuBPaY/BDQVBzXmRz+yGr60beCW
    P7IavrRt4JY/shq+tG3glj+9iAFTMGUmP4bYYF5f3sg/qkNvLDuIST+3CiXsmbYmP+Gxuhjm
    zCM/BDQVBzXmRz+yGr60beCWP7IavrRt4JY/wNqNhDPnoT/Wxk8n8aXUP9bGTyfxpdQ/xVuh
    a4E9pj/FW6FrgT2mP7HvyoowtQs/wEXrTVnQ1D/mrZ3wxhQMPwLFXR6NBvk/fK+yXhXZsz98
    r7JeFdmzP3yvsl4V2bM/1Zq8GS7K+j+ofOB+re+2P77Pndjg2CU/sk6U3gmJYj+7wgxShBGE
    PwLFXR6NBvk/fK+yXhXZsz98r7JeFdmzP6xknRha11Y/w6n+DgR4ED/Dqf4OBHgQP+atnfDG
    FAw/5q2d8MYUDD+W7qwwxNnNP6blXMQUJGw/sNyimn404D79Q+Cke3pYP1KWKx1x6mo/UpYr
    HXHqaj9SlisdcepqP8fNgw++IJo/ust58Az15j/QcaHbvfhBP9cUUkLUpoc/itz33X3Jaz79
    Q+Cke3pYP1KWKx1x6mo/UpYrHXHqaj+poSRQVq3fP8m3ynIxfkg/ybfKcjF+SD+w3KKafjTg
    P7Dcopp+NOA/heAuehRKVj+oXS5SFkkoP4pPMZW7iqA+8cere9bxgD8ytaDscYMqPzK1oOxx
    gyo/MrWg7HGDKj/Lg0yNjY9UP96JDm3soFs/0sRZTVo21D/SekGr2QrtP2amFG3lcDs+8cer
    e9bxgD8ytaDscYMqPzK1oOxxgyo/lVK3t3S7OT+z6DpKDKCEP7PoOkoMoIQ/ik8xlbuKoD+K
    TzGVu4qgP34ae4N1RMI/hyrGRnbhYT9zCBvvoUz/PtofMmLh6/Y/Hu9ICNKVoT8e70gI0pWh
    Px7vSAjSlaE/tPikZWgzhT/SiOs7cZnqP7IZzw3L7Vs/tizMbpAKzz9QvrGhdOP4PtofMmLh
    6/Y/Hu9ICNKVoT8e70gI0pWhP4elUtiniVs/kmR03vdxfD+SZHTe93F8P3MIG++hTP8/cwgb
    76FM/z9qhFHiYpzdP2wky9pYWfk/XsuDDcen9j7Ro8rk7kkcPw7xvhdK7zA/DvG+F0rvMD8O
    8b4XSu8wP4mb+9f8kTM/qeT2xUCRfj+m9idscvh1P6miIPNEHyQ/QMhTSkHCfj7Ro8rk7kkc
    Pw7xvhdK7zA/DvG+F0rvMD9yppUc8OFZP4HFpCgpNUE/gcWkKCk1QT9ey4MNx6f2P17Lgw3H
    p/Y/VZ1HV2kVZT9dhXYXpQkvP1D8VCUJKEg+zpmEpORyez7+kURjBrQSPv6RRGMGtBI+/pFE
    Ywa0Ej9nugYzErkOP4leYNF48VU/liF8coFSyz+QtaEiidCzPzTU08TYqps+zpmEpORyez7+
    kURjBrQSPv6RRGMGtBI/UJMj1Xt2Bz9ko+EAwmHdP2Sj4QDCYd0/UPxUJQkoSD9Q/FQlCShI
    Pz/q8PB91wM/T3sTvAFuLD9AOzIPDwGLPs6ZhKTkcns+6eEWXh7sNT7p4RZeHuw1PunhFl4e
    7DU/QI9t7vayYD9jy4zn7TTdP3V8hvyebZw/ah7fLeQoyz8umLSew1Z+Ps6ZhKTkcns+6eEW
    Xh7sNT7p4RZeHuw1Pz5GZf5L57w/PQQEe239oD89BAR7bf2gP0A7Mg8PAYs/QDsyDw8Biz8p
    7o7jMl9HPzUKEAVKRPs/In5vfwXIwT7OmYSk5HJ7PtRI5I8+gpQ+1Ejkjz6ClD7USOSPPoKU
    PxYkN1oxVmk/OgEM8/Qa0j9Ou//D7dglP0DePsn4Pqs/I62bFTRJXD7OmYSk5HJ7PtRI5I8+
    gpQ+1Ejkjz6ClD8h6IyScaCTPxGQfAnG/uU/EZB8Ccb+5T8ifm9/BcjBPyJ+b38FyME/HFQf
    UGrnkj8UOIjPKk5vAAAEAgAABv8AAAANAAAAAgAAABQAAAAQAAAEAgAAB/8AAAITAAAAAgAA
    AP4AAAAQAAAAEAAEAAkAAAAHU3RhZ2UgMAAEAAkAAAAHU3RhZ2UgMQAEAAkAAAAHU3RhZ2Ug
    MgAEAAkAAAAHU3RhZ2UgMwAEAAkAAAAHU3RhZ2UgNAAEAAkAAAAHU3RhZ2UgNQAEAAkAAAAH
    U3RhZ2UgNgAEAAkAAAAHU3RhZ2UgNwAEAAkAAAAHU3RhZ2UgOAAEAAkAAAAHU3RhZ2UgOQAE
    AAkAAAAIU3RhZ2UgMTAABAAJAAAACFN0YWdlIDExAAQACQAAAAhTdGFnZSAxMgAEAAkAAAAI
    U3RhZ2UgMTMABAAJAAAACFN0YWdlIDE0AAQACQAAAAhTdGFnZSAxNQAABAIAAAX/AAAAEAAA
    AAIABAAJAAAAAklEAAQACQAAAAVTdGFnZQAAAP4AAAD+AAACDgAAA8A/FhSh6CEAGT/TXi2m
    HznAPwNNvtSgCI8/A02+1KAIjz8DTb7UoAiPPvWKtkkuKYU+5ExoGdjK8T80ePgm9nhtPyQX
    BuSyXZE/GHxgbPs/Rz/TXi2mHznAPwNNvtSgCI8/A02+1KAIjz79MNFYjTbBPy8sjZl6mi8/
    LyyNmXqaLz8WFKHoIQAZPxYUoeghABk/AalxtRfdYD83fxS1UuxOPzSdfiVafCs/mdLniCmi
    WD8vk048PjOWPy+TTjw+M5Y/L5NOPD4zlj8aQsFmFk64PvZBXueq4Yk/UWnHkAPoeT8h9QAt
    r91RP0OFlXR3cgU/mdLniCmiWD8vk048PjOWPy+TTjw+M5Y/MSX8EAIMET9HgUbktdQxP0eB
    RuS11DE/NJ1+JVp8Kz80nX4lWnwrPzVKi/VGrwU/Ys40AbXWBT88uiXfZU0cP3IEk3S5NRQ/
    UOwSNr+G5z9Q7BI2v4bnP1DsEja/huc/No2sj7g7tT8FXNYm97GaP1lm6MFwKOM/L3v+mOMn
    cD9juJ5yjUHHP3IEk3S5NRQ/UOwSNr+G5z9Q7BI2v4bnP2A2WoLIzK8/U79KtEjRmD9Tv0q0
    SNGYPzy6Jd9lTRw/PLol32VNHD9kjjpTcxU5P4GhYMiOo7w/UwhTNlLiPj9Kkf3PubjGP12Q
    uILw6SA/XZC4gvDpID9dkLiC8OkgP0d42Wn2lpM/GX0qthLkoD9wGnw9Egd3Pz2COA++Kng/
    b9MeD6vGDT9Kkf3PubjGP12QuILw6SA/XZC4gvDpID+FpjKw21EtP2mYD6D8CuQ/aZgPoPwK
    5D9TCFM2UuI+P1MIUzZS4j4/jLsK08INjz+RQ95CGYGbP11AiSyMoSc/Jkzevc5c7z93itTl
    ehyeP3eK1OV6HJ4/d4rU5Xocnj9gAa43KkC1Py495xHTRPs/fjeZ4Xx4xT9QUuiorflcP4E8
    aS9WYxY/Jkzevc5c7z93itTlehyeP3eK1OV6HJ4/pXPLtoV3GT90pv8+B4XCP3Sm/z4HhcI/
    XUCJLIyhJz9dQIksjKEnP6e5evFAJdg/oUJVRuEtnT9qnlrUNcS8PwU5wE8ROfI/gu17SlQ/
    kz+C7XtKVD+TP4Lte0pUP5M/esgSVtUfpT9D7XqjHyUKP5UdiaduQXo/Y5O8PkJF+D+D/uBC
    YpsJPwU5wE8ROfI/gu17SlQ/kz+C7XtKVD+TP7qFq+jIt74/jcb7CUKu3j+NxvsJQq7eP2qe
    WtQ1xLw/ap5a1DXEvD+7OQnqDG9xP6tpxkJD+oo/cZT3BOSfAD7xAUNlZs+zP46VvHljXYY/
    jpW8eWNdhj+Olbx5Y12GP5cv3i2nerI/YKMNkNcD7z+rYHIsmCKwP4YPD3qxcBw/fMgPMUaZ
    rz7xAUNlZs+zP46VvHljXYY/jpW8eWNdhj/KRySjI8F6P6Q3qI6IVPg/pDeojohU+D9xlPcE
    5J8AP3GU9wTknwA/tYlUuWou0z+z6tEvpuvVP3hyeEDkFak+4p8bWaxeqz90MAqPCasjP3Qw
    Co8JqyM/dDAKjwmrIz+xl7X4qjW2P4K8SAbSOvk/pDR63ngbwT+sFrCRsL0uP3o/ba83yf8+
    4p8bWaxeqz90MAqPCasjP3QwCo8JqyM/sjh5mPVbPj/GmldMiapYP8aaV0yJqlg/eHJ4QOQV
    qT94cnhA5BWpP6iq6ga4HlI/pxTBJSFy/z+FKoTc2rB5PtbFCSAOriU/Yr7i7qkm/j9ivuLu
    qSb+P2K+4u6pJv4/xaxBFeGmNT+jXJJujVBiP7A4+5qk5hI/oN7/+6hyhj90mgNJFRwcPtbF
    CSAOriU/Yr7i7qkm/j9ivuLuqSb+P54nU2h9K5A/rTtkkpOfpT+tO2SSk5+lP4UqhNzasHk/
    hSqE3NqweT+Uw6pjMALzP5p9LI7rHMk/d7jpA7IIgD7Qp0NIFhYUP07Bds1KW54/TsF2zUpb
    nj9OwXbNSlueP7WpK3iGG0s/rekgClj6sz+w9ktY9TK1P72W00WNsF0/X4DTM0uhuz7Qp0NI
    FhYUP07Bds1KW54/TsF2zUpbnj+KWfT7XWEiP7CdUuK0pso/sJ1S4rSmyj93uOkDsgiAP3e4
    6QOyCIA/gMumwIdBXj+Jt5/iGjHJP3SZREmV/rM+wNP0326aaz85Qn8I/krJPzlCfwj+Ssk/
    OUJ/CP5KyT+i5MLK8L3iP8j82su58Q0/oBRGAvnLXT+rNfUtSXe1P1FmGobqY+I+wNP0326a
    az85Qn8I/krJPzlCfwj+Ssk/crrvbPynuj+XcD3PdV6FP5dwPc91XoU/dJlESZX+sz90mURJ
    lf6zP3Ke5pNi4+o/ch/6iyteuz9szxduEHCzPrmRo2kKT7Y/KmQeVm/shj8qZB5Wb+yGPypk
    HlZv7IY/htoa+sS/AD+lTKr/vDu/P5ExPuLZBgA/oyehqlXEZT9OPAlxzsLHPrmRo2kKT7Y/
    KmQeVm/shj8qZB5Wb+yGP1j5HIvjXss/g1OOSWoZBz+DU45JahkHP2zPF24QcLM/bM8XbhBw
    sz9Z41DuHdg7P2PVbSb/kMw/YNtDOIEkLT62pzwDG+TjPxdo2AhEbYw/F2jYCERtjD8XaNgI
    RG2MP2nDOJJwg2w/kLcJ2f8jTj+CNzPw8h34P5VtFwo/80o/QolK0hyyij62pzwDG+TjPxdo
    2AhEbYw/F2jYCERtjD9B+aJK5cygP3Lryskgqc8/cuvKySCpzz9g20M4gSQtP2DbQziBJC0/
    QweBQ+c9oj9Qgrxfz4JwP1UZKMUsL+I+tGduP1af3D8GM7/ZfxJ6PwYzv9l/Eno/BjO/2X8S
    ej9LN9b7ADyJP22SgNo2wXc/ca33KCfK5T90Bs9YdESePzac0FvnTdM+tGduP1af3D8GM7/Z
    fxJ6PwYzv9l/Eno/J/RkOxsUgD9L9zvLEKxoP0v3O8sQrGg/VRkoxSwv4j9VGSjFLC/iPyqP
    uvE3TLA/QO4kaB/4/z84NkXHRQSePrRnbj9Wn9w+64PnHIIZdj7rg+ccghl2PuuD5xyCGXY/
    IyFPOhi2iz9JHShNxe8CP1ni/UEBmfE/UFi/EloBez8riBuirEb8PrRnbj9Wn9w+64PnHIIZ
    dj7rg+ccghl2PxltaAuhxIo/I6LhtFanBT8jouG0VqcFPzg2RcdFBJ4/ODZFx0UEnj8ag2Xj
    M+tnPyGTYP/N0Z8/FhSh6CEAGT60Z24/Vp/cPsm8/nDVYMQ+ybz+cNVgxD7JvP5w1WDEPvWK
    tkkuKYU/HnKcJsUwcj80ePgm9nhtPyQXBuSyXZE/GHxgbPs/Rz60Z24/Vp/cPsm8/nDVYMQ+
    ybz+cNVgxD79MNFYjTbBPvTIXmZRvBM+9MheZlG8Ez8WFKHoIQAZPxYUoeghABk/AalxtRfd
    YD7/VBucbpBaPxYUoeghABk/014tph85wD8DTb7UoAiPPwNNvtSgCI8/A02+1KAIjz71irZJ
    LimFPuRMaBnYyvE/NHj4JvZ4bT8kFwbksl2RPxh8YGz7P0c/014tph85wD8DTb7UoAiPPwNN
    vtSgCI8+/TDRWI02wT8vLI2ZepovPy8sjZl6mi8/FhSh6CEAGT8WFKHoIQAZPwGpcbUX3WA/
    N38UtVLsTj8xNqK3lFkKP5nS54gpolg/Lq+LceWReD8ur4tx5ZF4Py6vi3HlkXg/FpehXj8n
    cT70QssWLOOKP1EDiZwfLIM/Ime69sGb2j9CLmDhCkXdP5nS54gpolg/Lq+LceWReD8ur4tx
    5ZF4PzEqT9nz2t0/SsuegsBhWT9Ky56CwGFZPzE2oreUWQo/MTait5RZCj81iLoSOnIQP2GP
    gP6odpE/OniDznYEUz9xNgN/8kuqP1FaC+EgoCg/UVoL4SCgKD9RWgvhIKAoPzMv8Eqsg1M/
    A7PygKAjOD9amAaxWaqgPzHCX/tc+oc/Ypui68KJAz9xNgN/8kuqP1FaC+EgoCg/UVoL4SCg
    KD9epEAHje8cP1VwBrYHGlw/VXAGtgcaXD86eIPOdgRTPzp4g852BFM/ZPuinXj8PD+BxZMV
    409BP1MuDa4DpUc/SGSdj5r/eT9gVZX9w+9iP2BVlf3D72I/YFWV/cPvYj9G+mwElaORPxi4
    Oce2nXk/b6O3onBQ9T8/Szd8TYTWP3A66D3q/Aw/SGSdj5r/eT9gVZX9w+9iP2BVlf3D72I/
    gqu1cuJALz9plCoSi9ccP2mUKhKL1xw/Uy4NrgOlRz9TLg2uA6VHP5AVgOtphx4/jygUF3iI
    6z9avq1dvzOwPydZoOTEARA/dZEHBlorYT91kQcGWithP3WRBwZaK2E/YeIcXRMyRD8vyuDk
    G0dMP4EVguWaTVY/VJFuLL0vtj98lPGPG5iJPydZoOTEARA/dZEHBlorYT91kQcGWithP56e
    e1nkjC0/epY8GQaP2z96ljwZBo/bP1q+rV2/M7A/Wr6tXb8zsD+o7Ygk0/rcP6IJMkp0CQE/
    bo29KKdIBz8K2EuGQIwAP4NAosOcAZc/g0Ciw5wBlz+DQKLDnAGXP3v9bGSJnmQ/SRfL/jl0
    Vj+Uxpx5amG8P2WYzpVY0YU/g0YKzonnED8K2EuGQIwAP4NAosOcAZc/g0Ciw5wBlz+5Muho
    HOVqP43KuTkko44/jcq5OSSjjj9ujb0op0gHP26NvSinSAc/uSxsDo7LET+rgS7emtaWP3jp
    iVshQOY+9B/irrnOFD+Q7k9ZGpYuP5DuT1kali4/kO5PWRqWLj+Wd6KxH6UJP2H2mc5XNxI/
    pdCpdLmGcT+JA8GL5/qXP3rT1ujEHEM+9B/irrnOFD+Q7k9ZGpYuP5DuT1kali4/x74Sfng2
    ST+iwF7raqHIP6LAXutqocg/eOmJWyFA5j946YlbIUDmP7WEOUJSZ2g/taJ+NXVX6T95PWcH
    6a0vPuHChb85NFE/dTIyBNLxCT91MjIE0vEJP3UyMgTS8Qk/tNrONEql4j+DFai3BE7lP6IS
    MsK9qZw/qqVLOsmjlz9uN0j4BYfJPuHChb85NFE/dTIyBNLxCT91MjIE0vEJP7QWJr8V6SA/
    x11+aZWIhj/HXX5plYiGP3k9ZwfprS8/eT1nB+mtLz+mmi9ps5flP6fbVUe4Lso/hmIWNGVQ
    vD7XjIFwO+16P2bClQIXVmM/ZsKVAhdWYz9mwpUCF1ZjP8c9jUOfzHY/oxqRxcdFdj+vQSzZ
    fNOeP6M+mX7BuQw/bjnG0wyy7T7XjIFwO+16P2bClQIXVmM/ZsKVAhdWYz+eP6ExOCicP65W
    LHppweE/rlYsemnB4T+GYhY0ZVC8P4ZiFjRlULw/kU89K4D82z+YpDMyRbk+P3doGIpy4Vk+
    0SinB6yZKz9OE8yloLT0P04TzKWgtPQ/ThPMpaC09D+3UEw+Yl2RP66kqQ2mFLk/s5jH5Rqa
    Bj+9BzM5CVmzP2QyUEmqXBs+0SinB6yZKz9OE8yloLT0P04TzKWgtPQ/h63RmmzraD+ti/Pj
    iyweP62L8+OLLB4/d2gYinLhWT93aBiKcuFZP3qPosS0XJg/h3yD1peEKT9uFSKTTmnAPsO6
    fzuSJFM/OgHTs3XVlD86AdOzddWUPzoB07N11ZQ/owBrCv/utD/HeZgwMr3IP6BNiBnafEo/
    qps90c/uYD9WDuJk63PDPsO6fzuSJFM/OgHTs3XVlD86AdOzddWUP3ESDtx7MQk/lR4zVH1w
    BT+VHjNUfXAFP24VIpNOacA/bhUik05pwD9rbX4XzHvPP3RxP6mfOAs/cE042nBhmj66ekw8
    iRzbPyc0AmGHMCY/JzQCYYcwJj8nNAJhhzAmP4VbAys9vjQ/p6om9Ousbj+Sl3rxoIQiP6OR
    RBzkTng/Ru8CIaJROT66ekw8iRzbPyc0AmGHMCY/JzQCYYcwJj9W4t29dQNkP4PLvhNRLmo/
    g8u+E1Euaj9wTTjacGGaP3BNONpwYZo/WWEKBG24DD9e+dVo7CkCP1s9/LdSMyA+tYbDMcvI
    8T8ZGaWUzHggPxkZpZTMeCA/GRmllMx4ID9odLlc10+yP5DkWKsmMGE/hMAEPXoxHz+WJtDn
    si7QP0AzydhJ2tg+tYbDMcvI8T8ZGaWUzHggPxkZpZTMeCA/QSKPAFjOfT9vzeHpdKMGP2/N
    4el0owY/Wz38t1IzID9bPfy3UjMgP0VoPgqj0tw/T8VCO7O5Cz9QwDsAwza2PrRnbj9Wn9w/
    BOj6ZqW1bT8E6PpmpbVtPwTo+maltW0/SOJZm5LPST9xXaGUIs9kP3VlSw2Sjc0/eBpFL7E+
    dT8zT+XJiVlUPrRnbj9Wn9w/BOj6ZqW1bT8E6PpmpbVtPyR8C0+Ub+c/TRhaJ4UvZz9NGFon
    hS9nP1DAOwDDNrY/UMA7AMM2tj8rlqTFla1ePz5INIYrQEQ/NeJJvIxkIj60Z24/Vp/cPuxV
    CnbTg9c+7FUKdtOD1z7sVQp204PXPyIRkPNgEmo/SQEX2zJ0/D9YICS8l8QrP1Bs4ZZu73Q/
    LJeobTQ2BT60Z24/Vp/cPuxVCnbTg9c+7FUKdtOD1z8TntjZbbxZPyMFyVsnTyo/IwXJWydP
    Kj814km8jGQiPzXiSbyMZCI/GjEcdXMg0z8jA+lZvRxfPxYUoeghABk+tGduP1af3D7JvP5w
    1WDEPsm8/nDVYMQ+ybz+cNVgxD71irZJLimFPx5ynCbFMHI/NHj4JvZ4bT8kFwbksl2RPxh8
    YGz7P0c+tGduP1af3D7JvP5w1WDEPsm8/nDVYMQ+/TDRWI02wT70yF5mUbwTPvTIXmZRvBM/
    FhSh6CEAGT8WFKHoIQAZPwGpcbUX3WA+/1QbnG6QWj8WFKHoIQAZP9NeLaYfOcA/A02+1KAI
    jz8DTb7UoAiPPwNNvtSgCI8+9Yq2SS4phT7kTGgZ2MrxPzR4+Cb2eG0/JBcG5LJdkT8YfGBs
    +z9HP9NeLaYfOcA/A02+1KAIjz8DTb7UoAiPPv0w0ViNNsE/LyyNmXqaLz8vLI2ZepovPxYU
    oeghABk/FhSh6CEAGT8BqXG1F91gPzd/FLVS7E4/LxKhFe1pUT+Z0ueIKaJYPycFLjG0Zj8/
    JwUuMbRmPz8nBS4xtGY/Pxasd5H1d5U+5ExoGdjK8T9YD5feDrOHPyQXBuSyXZE/PmlsRGcW
    VD+Z0ueIKaJYPycFLjG0Zj8/JwUuMbRmPz8yxuXyeyKqP1AwNTc1cns/UDA1NzVyez8vEqEV
    7WlRPy8SoRXtaVE/Mx+VpV4Viz9kD/k+OsFQPz4QGt/XH3A/c1YoPiPdfz9GS+BcMDZmP0ZL
    4FwwNmY/RkvgXDA2Zj8kySnP0FmZPu4dj684fSw/YlFOuTKX9z8vLeyqseb/P1vTUmpVECY/
    c1YoPiPdfz9GS+BcMDZmP0ZL4FwwNmY/Yh7ZDWdlXT9caz5h4dvcP1xrPmHh29w/PhAa39cf
    cD8+EBrf1x9wP2BVu6xLiPA/h77aqDpyST9T8CGbYoVuP0pZ0ziTx3M/ZPO2nhkMJz9k87ae
    GQwnP2Tztp4ZDCc/PAK5rgrLtj7+R1ClMovYP2PdZSxchJ0/P5cVwG7u3T92UaA9Nu+WP0pZ
    0ziTx3M/ZPO2nhkMJz9k87aeGQwnP4Yc9nKOSNE/duS3djgxIz925Ld2ODEjP1PwIZtihW4/
    U/Ahm2KFbj+Fwl0tzd4NP5miYJIoUk8/ZvSuPh+TQj8kiufOMF2IP42cJeXe9no/jZwl5d72
    ej+NnCXl3vZ6P0olYO8hab4/Cch5z/sCJD9jWYHU4VVwP0lUp306BYM/lZO/eUPFfj8kiufO
    MF2IP42cJeXe9no/jZwl5d72ej+UFc5vivEZP4TUheTOb/4/hNSF5M5v/j9m9K4+H5NCP2b0
    rj4fk0I/ojm+ZCPndz+zeA6nj0KeP319KyqPUs4/A+sm0dYzHT+wSZkDZwdCP7BJmQNnB0I/
    sEmZA2cHQj9VeiIHmjyAPxRfBqAitsw/XPxy8yEvMT9T6mxFudk6P7MamNAHbuU/A+sm0dYz
    HT+wSZkDZwdCP7BJmQNnB0I/bKBCNQglsT+SqMOgJYgzP5Kow6AliDM/fX0rKo9Szj99fSsq
    j1LOP8yQe7QIUEM/xnVBbiBE2T+I8+gSGJ0pPu7x7Ojdlr0/6GiKQXzV0j/oaIpBfNXSP+ho
    ikF81dI/MCgItuKfLD8ecFJQno9LPzR4+Cb2eG0/XiDRP3dUMj/EqPFb8/1xPu7x7Ojdlr0/
    6GiKQXzV0j/oaIpBfNXSPzXknQJp6Q4/Z1xY+5PUSz9nXFj7k9RLP4jz6BIYnSk/iPPoEhid
    KT+tyXfSL6XCP6prVuBTY5U/wXEJJjMqhj7umyVfAe/CP7BJmQNnB0I/sEmZA2cHQj+wSZkD
    ZwdCP1Ubvw6dEpQ/O6a0Lobctz9Z6645PePIP3o5arnctII/4Qg3CLdB0T7umyVfAe/CP7BJ
    mQNnB0I/sEmZA2cHQj9ZVCG881djP4k/r4qXTys/iT+vipdPKz/BcQkmMyqGP8FxCSYzKoY/
    dCsea0Nrhj+lDgg8iZJlP+WJv8eMWDo+7ozbEvXGiz91t3avNAmaP3W3dq80CZo/dbd2rzQJ
    mj+CMn0bFVe3P1URlevCA0A/hm1cu1e2aD+NT5Aik6DkP7jmfbzZwyY+7ozbEvXGiz91t3av
    NAmaP3W3dq80CZo/bGiYndITAj+pYrhJ+MqjP6liuEn4yqM/5Ym/x4xYOj/lib/HjFg6P0Ho
    9eiroMw/iqjdNI6oZT+ueMojQXQ+PueI1z6sdQE/QqUA2zRiSz9CpQDbNGJLP0KlANs0Yks/
    l1DLBv+B2z+OJS3Hh6J1P7sihc2LB4o/wNo02J1tuz+GTaCdkzc4PueI1z6sdQE/QqUA2zRi
    Sz9CpQDbNGJLP4wYVUssPog/sfamt7dQGT+x9qa3t1AZP654yiNBdD4/rnjKI0F0Pj9ZTx58
    RnWFP5V8y2q242w/hATtOXYNyD7dj2Lj+TJAPxlTbQn8wcU/GVNtCfzBxT8ZU20J/MHFP7cg
    Nyrk8C0/vTXqSR/b+j/GRMNzXSXOP8DaSOB57CM/X04eK2aKKj7dj2Lj+TJAPxlTbQn8wcU/
    GVNtCfzBxT91gmGTvTf3P5dKAch6eik/l0oByHp6KT+EBO05dg3IP4QE7Tl2Dcg/VtK13MWE
    Zz9yHhx5NspOP2WCCGtaxKo+w5yTU6FwZT8BeeVeahIjPwF55V5qEiM/AXnlXmoSIz+ZJ0MO
    /AMPP799fnySk/s/nXdjGBsTMz+TYOVJse+jP0T2+IkjCM8+w5yTU6FwZT8BeeVeahIjPwF5
    5V5qEiM/ZboT7Osa2z9u1E36rjtwP27UTfquO3A/ZYIIa1rEqj9lgghrWsSqP0W7kRQmokA/
    UjL7v9bdoT9QlP4SwQCXPrg6NCz94Dk+8HoxqNIymD7wejGo0jKYPvB6MajSMpg/bDupPbDI
    dz+NXjWiIl/8P5Jfl+fbySE/hqkWY/l12T8zBE259YjdPrg6NCz94Dk+8HoxqNIymD7wejGo
    0jKYP1MHG8pWepw/YCbu3H+PpD9gJu7cf4+kP1CU/hLBAJc/UJT+EsEAlz807qHOz8N+P0SM
    6SypkcY/QG/p92GA0D60Z24/Vp/cPuNhsM8ol2s+42GwzyiXaz7jYbDPKJdrP0iJJMNHU4o/
    b6/e54og7z+CP0Hg1uzuP3RMgnsdQ6Y/JgTy7Iiiyz60Z24/Vp/cPuNhsM8ol2s+42GwzyiX
    az8shZEhgvRrP0fRbrantBE/R9Futqe0ET9Ab+n3YYDQP0Bv6fdhgNA/IISNut+20j82p2yN
    I0mNPzKZd/U+aY0+tGduP1af3D7W4rxOUw0SPtbivE5TDRI+1uK8TlMNEj8gBvJwrz1+P0bx
    FwnUYqE/XnAO2ipi8j9Om7D+ox7EPyAk4IApm/w+tGduP1af3D7W4rxOUw0SPtbivE5TDRI/
    GvtCpSmF/T8grmLiY2nZPyCuYuJjadk/Mpl39T5pjT8ymXf1PmmNPwW9RXd/8hc/HyaJKEiv
    0z8WFKHoIQAZPrRnbj9Wn9w+ybz+cNVgxD7JvP5w1WDEPsm8/nDVYMQ+9Yq2SS4phT8ecpwm
    xTByPzR4+Cb2eG0/JBcG5LJdkT8YfGBs+z9HPrRnbj9Wn9w+ybz+cNVgxD7JvP5w1WDEPv0w
    0ViNNsE+9MheZlG8Ez70yF5mUbwTPxYUoeghABk/FhSh6CEAGT8BqXG1F91gPv9UG5xukFoA
    AAQCAAAG/wAAAA0AAAADAAAAFAAAABAAAAADAAAEAgAAB/8AAAITAAAAAwAAAP4AAAAQAAAA
    EAAEAAkAAAAHU3RhZ2UgMAAEAAkAAAAHU3RhZ2UgMQAEAAkAAAAHU3RhZ2UgMgAEAAkAAAAH
    U3RhZ2UgMwAEAAkAAAAHU3RhZ2UgNAAEAAkAAAAHU3RhZ2UgNQAEAAkAAAAHU3RhZ2UgNgAE
    AAkAAAAHU3RhZ2UgNwAEAAkAAAAHU3RhZ2UgOAAEAAkAAAAHU3RhZ2UgOQAEAAkAAAAIU3Rh
    Z2UgMTAABAAJAAAACFN0YWdlIDExAAQACQAAAAhTdGFnZSAxMgAEAAkAAAAIU3RhZ2UgMTMA
    BAAJAAAACFN0YWdlIDE0AAQACQAAAAhTdGFnZSAxNQAAABAAAAADAAQACQAAAAlTdWJ0eXBl
    IDEABAAJAAAACVN1YnR5cGUgMgAEAAkAAAAJU3VidHlwZSAzAAAEAgAABf8AAAAQAAAAAwAE
    AAkAAAACSUQABAAJAAAABVN0YWdlAAQACQAAAAdzdWJ0eXBlAAAA/gAAAP4AAAIOAAAALT/w
    AAAAAAAAQBAAAAAAAABACAAAAAAAAAAAAAAAAAAAQCIAAAAAAABAIAAAAAAAAEAIAAAAAAAA
    P/AAAAAAAAA/8AAAAAAAAEAAAAAAAAAAAAAAAAAAAABAEAAAAAAAAEAQAAAAAAAAQAgAAAAA
    AAAAAAAAAAAAAEAYAAAAAAAAQBgAAAAAAABAIgAAAAAAAEAUAAAAAAAAQBQAAAAAAABALAAA
    AAAAAEAgAAAAAAAAQCAAAAAAAABAGAAAAAAAAEAqAAAAAAAAQCoAAAAAAABAFAAAAAAAAEAi
    AAAAAAAAQAAAAAAAAABAKgAAAAAAAEAcAAAAAAAAQBwAAAAAAABAAAAAAAAAAEAoAAAAAAAA
    QCgAAAAAAABAHAAAAAAAAEAsAAAAAAAAQCwAAAAAAABAKAAAAAAAAEAkAAAAAAAAQCQAAAAA
    AABAJAAAAAAAAEAmAAAAAAAAQCYAAAAAAABAJgAAAAAAAAAABAIAAAb/AAAADQAAAAIAAAAD
    AAAADwAABAIAAAf/AAACEwAAAAIAAAAQAAAAAwAEAAkAAAAJU3VidHlwZSAxAAQACQAAAAlT
    dWJ0eXBlIDIABAAJAAAACVN1YnR5cGUgMwAAAP4AAAQCAAAF/wAAABAAAAACAAQACQAAAAdz
    dWJ0eXBlAAQACQAAAAhwb3NpdGlvbgAAAP4AAAD+AAACDgAAAC0/8AAAAAAAAEAQAAAAAAAA
    QAgAAAAAAAAAAAAAAAAAAEAiAAAAAAAAQCAAAAAAAABACAAAAAAAAD/wAAAAAAAAP/AAAAAA
    AABAAAAAAAAAAAAAAAAAAAAAQBAAAAAAAABAEAAAAAAAAEAIAAAAAAAAAAAAAAAAAABAGAAA
    AAAAAEAYAAAAAAAAQCIAAAAAAABAFAAAAAAAAEAUAAAAAAAAQCwAAAAAAABAIAAAAAAAAEAg
    AAAAAAAAQBgAAAAAAABAKgAAAAAAAEAqAAAAAAAAQBQAAAAAAABAIgAAAAAAAEAAAAAAAAAA
    QCoAAAAAAABAHAAAAAAAAEAcAAAAAAAAQAAAAAAAAABAKAAAAAAAAEAoAAAAAAAAQBwAAAAA
    AABALAAAAAAAAEAsAAAAAAAAQCgAAAAAAABAJAAAAAAAAEAkAAAAAAAAQCQAAAAAAABAJgAA
    AAAAAEAmAAAAAAAAQCYAAAAAAAAAAAQCAAAG/wAAAA0AAAACAAAAAwAAAA8AAAQCAAAH/wAA
    AhMAAAACAAAAEAAAAAMABAAJAAAACVN1YnR5cGUgMQAEAAkAAAAJU3VidHlwZSAyAAQACQAA
    AAlTdWJ0eXBlIDMAAAD+AAAEAgAABf8AAAAQAAAAAgAEAAkAAAAHc3VidHlwZQAEAAkAAAAI
    cG9zaXRpb24AAAD+AAAA/gAAAw4AAAADP8a2kVHxdyI/zW0l6O2z+j/i9xIxSDU6AAAEAgAA
    Bv8AAAANAAAAAQAAAAMAAAQCAAAH/wAAAhMAAAABAAAAEAAAAAMABAAJAAAACVN1YnR5cGUg
    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
    AAA/8AAAAAAAAAAABAIAAAX/AAAAEAAAAAYABAAJAAAACm1sX3N1YnR5cGUABAAJAAAACG1s
    X3N0YWdlAAQACQAAAA9wcm9iX21sX3N1YnR5cGUABAAJAAAADXByb2JfbWxfc3RhZ2UABAAJ
    AAAADHByb2Jfc3VidHlwZQAEAAkAAAAObWxfc3VidHlwZV9vbGQAAAQCAAAAAQAEAAkAAAAJ
    cm93Lm5hbWVzAAAADQAAAAKAAAAA////7AAABAIAAAL/AAAAEAAAAAMABAAJAAAABnRibF9k
    ZgAEAAkAAAADdGJsAAQACQAAAApkYXRhLmZyYW1lAAAEAgAABP8AAAINAAAABAAAAAAAAAAB
    AAAAAgAAAAMAAAQCAAAF/wAAABAAAAAEAAQACQAAAAEwAAQACQAAAAEyAAQACQAAAAEzAAQA
    CQAAAAExAAAA/gAAAP4AAAAOAAAAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAP/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQCAAAF/wAAABAAAAANAAQACQAAAAptbF9zdWJ0eXBl
    AAQACQAAAA9wcm9iX21sX3N1YnR5cGUABAAJAAAACG1sX3N0YWdlAAQACQAAAA1wcm9iX21s
    X3N0YWdlAAQACQAAAAxwcm9iX3N1YnR5cGUABAAJAAAACnByb2Jfc3RhZ2UABAAJAAAAEnBy
    b2Jfc3VidHlwZV9zdGFnZQAEAAkAAAAObWxfc2VxdWVuY2VfRU0ABAAJAAAAE21sX3NlcXVl
    bmNlX3ByZXZfRU0ABAAJAAAAB21sX2ZfRU0ABAAJAAAADG1sX2ZfcHJldl9FTQAEAAkAAAAX
    c3VidHlwZV9hbmRfc3RhZ2VfdGFibGUABAAJAAAADm1sX3N1YnR5cGVfb2xkAAAEAgAAAv8A
    AAAQAAAAAgAEAAkAAAANU3VTdGFJbl9tb2RlbAAEAAkAAAAEbGlzdAAABAIAAAP/AAAADQAA
    AAEAAAADAAAEAgAAAAEABAAJAAAAEGJpb21hcmtlcl9ncm91cHMAAAMTAAAAAwAAABAAAAAF
    AAQACQAAAAtCaW9tYXJrZXIgMQAEAAkAAAALQmlvbWFya2VyIDIABAAJAAAAC0Jpb21hcmtl
    ciAzAAQACQAAAAtCaW9tYXJrZXIgNAAEAAkAAAALQmlvbWFya2VyIDUAAAAQAAAABQAEAAkA
    AAAHZ3JvdXAgMQAEAAkAAAAHZ3JvdXAgMQAEAAkAAAAHZ3JvdXAgMgAEAAkAAAAHZ3JvdXAg
    MgAEAAkAAAAHZ3JvdXAgMwAAABAAAAAFAAQACQAAAAcjQzg3QThBAAQACQAAAAcjQzg3QThB
    AAQACQAAAAcjNkI5RDU5AAQACQAAAAcjNkI5RDU5AAQACQAAAAcjNUY5NkMyAAAEAgAABf8A
    AAAQAAAAAwAEAAkAAAAJYmlvbWFya2VyAAQACQAAAA9iaW9tYXJrZXJfZ3JvdXAABAAJAAAA
    C2dyb3VwX2NvbG9yAAAEAgAACP8AAAANAAAAAoAAAAD////7AAAEAgAAAv8AAAAQAAAAAwAE
    AAkAAAAGdGJsX2RmAAQACQAAAAN0YmwABAAJAAAACmRhdGEuZnJhbWUAAAD+AAAEAgAAAAEA
    BAAJAAAAEGJpb21hcmtlcl9sZXZlbHMAAAITAAAABQAAAA0AAAAEAAAAAAAAAAEAAAACAAAA
    AwAAAA0AAAAEAAAAAAAAAAEAAAACAAAAAwAAAA0AAAAEAAAAAAAAAAEAAAACAAAAAwAAAA0A
    AAAEAAAAAAAAAAEAAAACAAAAAwAAAA0AAAAEAAAAAAAAAAEAAAACAAAAAwAABAIAAAX/AAAA
    EAAAAAUABAAJAAAAC0Jpb21hcmtlciAxAAQACQAAAAtCaW9tYXJrZXIgMgAEAAkAAAALQmlv
    bWFya2VyIDMABAAJAAAAC0Jpb21hcmtlciA0AAQACQAAAAtCaW9tYXJrZXIgNQAAAP4AAAQC
    AAAAAQAEAAkAAAANc3VidHlwZV9vcmRlcgAAAA0AAAADAAAAAQAAAAIAAAADAAAEAgAAAAEA
    BAAJAAAAAml4AAAADQAAAAMAAAADAAAAAQAAAAIAAAD+

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
        .. ..$ subtype  : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ iteration: NULL
       $ samples_likelihood     : num [1:100000, 1] -94 -94 -94 -94 -96.7 ...
       $ ml_subtype             : Factor w/ 4 levels "Type 0","Type 1",..: 4 1 4 4 4 4 4 4 4 4 ...
        ..- attr(*, "n_s")= int 3
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "2" "3" "1"
       $ prob_ml_subtype        : num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
       $ ml_stage               : num [1:20, 1] 8 0 6 6 6 10 11 10 10 7 ...
       $ prob_ml_stage          : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
       $ prob_subtype           : 'prob_subtype' num [1:20, 1:3] 0.0166 0.153 0.0132 0.0132 0.0132 ...
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
       $ ml_sequence_EM         : num [1:3, 1:15] 3 1 4 8 0 9 1 3 1 4 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position: NULL
       $ ml_sequence_prev_EM    : num [1:3, 1:15] 3 1 4 8 0 9 1 3 1 4 ...
        ..- attr(*, "dimnames")=List of 2
        .. ..$ subtype : chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
        .. ..$ position: NULL
       $ ml_f_EM                : 'ml_f_EM' num [1:3(1d)] 0.593 0.177 0.23
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ ml_f_prev_EM           : 'ml_f_EM' num [1:3(1d)] 0.593 0.177 0.23
        ..- attr(*, "dimnames")=List of 1
        .. ..$ subtype: chr [1:3] "Subtype 1" "Subtype 2" "Subtype 3"
       $ subtype_and_stage_table: tibble [20 x 6] (S3: tbl_df/tbl/data.frame)
        ..$ ml_subtype     : Factor w/ 4 levels "Type 0","Type 1",..: 4 1 4 4 4 4 4 4 4 4 ...
        .. ..- attr(*, "n_s")= int 3
        ..$ ml_stage       : num [1:20] 8 0 6 6 6 10 11 10 10 7 ...
        ..$ prob_ml_subtype: num [1:20] 0.968 0.695 0.973 0.973 0.973 ...
        ..$ prob_ml_stage  : num [1:20] 0.673 0.303 0.763 0.763 0.763 ...
        ..$ prob_subtype   : num [1:20, 1:3] 0.0166 0.153 0.0132 0.0132 0.0132 ...
        ..$ ml_subtype_old : num [1:20] 1 0 1 1 1 1 1 1 1 1 ...
        ..- attr(*, "subtype_map")= Named int [1:4] 0 1 2 3
        .. ..- attr(*, "names")= chr [1:4] "0" "2" "3" "1"
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
       - attr(*, "subtype_order")= num [1:3] 3 1 2
       - attr(*, "ix")= int [1:3] 3 1 2

