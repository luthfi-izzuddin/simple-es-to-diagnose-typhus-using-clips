; Mengidentifikasi kondisi fisik seseorang
(defrule isSakit
    =>
    (printout t crlf "Apakah Anda merasa tidak enak badan?" crlf "0: Tidak" crlf "1: Ya" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (isSakit yes))
    ) (if (= ?x 0)
        then (assert (isSakit no))
    )
)

;----------------------------isSakit YES----------------------------
; Ditanyakan apakah pasien mengalami demam
(defrule isDemam (isSakit yes)
    =>
    (printout t crlf "Apakah Anda mengalami demam?" crlf "0: Tidak" crlf "1: Ya" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (isDemam yes))
    ) (if (= ?x 0)
        then (printout t crlf "Anda mungkin kelelahan, perbanyak istirahat dan jaga pola makan." crlf)
    )
)

; Ditanyakan apakah pasien mengalami kurang nafsu makan
(defrule isKurangNafsuMakan (isDemam yes)
    =>
    (printout t crlf "Apakah nafsu makan Anda berkurang?" crlf "0: Tidak" crlf "1: Ya" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (isKurangNafsuMakan yes))
    ) (if (= ?x 0)
        then (printout t crlf "Kemungkinan Anda hanya demam biasa. Perbanyak istirahat dan disarankan meminum obat pereda nyeri dan demam. Jika masih berkelajutan, silakan datang ke fasilitas kesehatan terdekat." crlf)
    )
)

; Ditanyakan apakah pasien mengalami gangguan pencernaan karena kurangnya nafsu makan
(defrule isGangguanPencernaan (isKurangNafsuMakan yes)
    =>
    (printout t crlf "Bagaimana kondisi perut & pencernaan Anda?" crlf "0: Biasa saja" crlf "1: Sakit" crlf)
    (bind ?x (read))
    (if (= ?x 0)
        then (printout t crlf "Perbanyak istirahat, perbaiki pola makan, dan jangan lupa minum vitamin untuk mengembalikan nafsu makan yang hilang." crlf)
    ) (if (= ?x 1)
        then (printout t crlf "Apakah sakit perut tersebut disertai mual?" crlf "0: Tidak" crlf "1: Ya" crlf)
        (bind ?x (read))
        (if (= ?x 1)
            then (assert (isGangguanPencernaan yes))
        ) (if (= ?x 0)
            then (printout t crlf "Anda kemungkinan mengalami gejala sakit maag. Jaga & atur pola makan dan disarankan untuk meminum obat maag." crlf)
        )
    )
)

; Ditanyakan apakah pasien juga mengalami diare ketika mengalami gangguan pencernaan
(defrule isDiare (isGangguanPencernaan yes)
    =>
    (printout t crlf "Apakah Anda juga mengalami diare?" crlf "0: Tidak" crlf "1: Ya" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (printout t crlf "Berdasarkan gejala yang dialami, Anda mengalami gejala penyakit Typhus. Silakan segera merujuk ke rumah sakit terdekat untuk penanganan lebih lanjut." crlf)
    ) (if (= ?x 0)
        then (printout t crlf "Anda mengalami beberapa gejala penyakit Typhus. Silakan datang ke fasilitas kesehatan terdekat untuk pengecekan lebih lanjut." crlf)
    )
)

;----------------------------isSakit NO----------------------------
; Pertanyaan ketika pasien tidak mengalami tidak enak badan
(defrule semangat (isSakit no)
    =>
    (printout t crlf "Selalu jaga kesehatan ya!" crlf)
)
