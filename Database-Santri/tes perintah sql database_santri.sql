use database_santri;
-- ------------------------------------------------------------------------------------------------------------

-- melihat data santri keseluruhan 
SELECT s.id_santri, s.nama, s.gender, m.nama AS nama_masjid, o.nama AS nama_orangtua, o.telepon as telepon_orangtua
FROM santri s 
JOIN jamaah j ON s.id_santri = j.id_santri
JOIN masjid m ON j.id_masjid = m.id_masjid  
JOIN orangtua o ON s.id_orangtua = o.id_orangtua;

-- melihat data guru keseluruhan
SELECT g.id_guru, g.nama, g.gender, g.bidang_ajar, g.telepon, m.nama AS nama_masjid
FROM guru g
JOIN abdi a ON g.id_guru = a.id_guru
JOIN masjid m ON a.id_masjid = m.id_masjid;

-- melihat data kitab keseluruhan
SELECT kitab.id_kitab,kitab.nama AS nama_kitab,masjid.nama AS nama_masjid,COUNT(hatam.id_hatam) AS dihatamkan_berapa_kali
FROM kitab JOIN aset ON kitab.id_kitab = aset.id_kitab
JOIN masjid ON aset.id_masjid = masjid.id_masjid
LEFT JOIN hatam ON kitab.id_kitab = hatam.id_kitab
GROUP BY kitab.id_kitab, masjid.id_masjid
ORDER BY masjid.nama, dihatamkan_berapa_kali DESC;

-- melihat data masjid keseluruhan
SELECT masjid.id_masjid, masjid.nama AS nama_masjid, masjid.alamat AS alamat_masjid, masjid.tahun_berdiri, masjid.nama_tpa,
    COUNT(DISTINCT santri.id_santri) AS jumlah_santri,
    COUNT(DISTINCT aset.id_kitab) AS jumlah_kitab,
    COUNT(DISTINCT guru.id_guru) AS jumlah_guru
FROM masjid
LEFT JOIN jamaah ON masjid.id_masjid = jamaah.id_masjid
LEFT JOIN santri ON jamaah.id_santri = santri.id_santri
LEFT JOIN aset ON masjid.id_masjid = aset.id_masjid
LEFT JOIN kitab ON aset.id_kitab = kitab.id_kitab
LEFT JOIN abdi ON masjid.id_masjid = abdi.id_masjid
LEFT JOIN guru ON abdi.id_guru = guru.id_guru
GROUP BY masjid.id_masjid
ORDER BY masjid.nama;

# Menampilkan jadwal mengaji pada hari tertentu beserta data santri yang hadir:
SELECT j.hari, j.jam_mulai, j.jam_berakhir, s.nama, ps.kehadiran 
FROM jadwal j
JOIN presensi_santri ps ON j.id_jadwal = ps.id_jadwal
JOIN santri s ON ps.id_santri = s.id_santri
WHERE j.hari = 'Senin'
ORDER BY j.jam_mulai;

# mencari siswa yang pernah alpa pada pelajaran tertentu : 
SELECT s.nama, s.gender, j.kegiatan, j.tgl_jadwal, ps.kehadiran
FROM santri s  
JOIN presensi_santri ps ON s.id_santri = ps.id_santri
JOIN jadwal j ON ps.id_jadwal = j.id_jadwal
WHERE ps.kehadiran = 'alpa' AND ps.id_jadwal = 'J001'  
ORDER BY s.nama;

# melihat jumlah kitab yang telah dihapalkan oleh masing masing santri :
SELECT s.nama, COUNT(h.id_hatam) AS jumlah_kitab_dihafalkan
FROM santri s
LEFT JOIN hatam h ON s.id_santri = h.id_santri  
GROUP BY s.id_santri
ORDER BY jumlah_kitab_dihafalkan DESC;

# melihat guru yang mengajar dihari tertentu : 
SELECT g.nama, g.bidang_ajar, j.hari, j.tgl_jadwal
FROM guru g
JOIN presensi_guru pg ON g.id_guru = pg.id_guru  
JOIN jadwal j ON pg.id_jadwal = j.id_jadwal
WHERE j.hari = 'Senin'
ORDER BY g.nama;

# Melihat keterlibatan orang tua santri berdasarkan kehadiran santri:
SELECT o.nama AS nama_orangtua, s.nama AS nama_santri, COUNT(ps.id_santri) AS jumlah_kehadiran
FROM orangtua o
JOIN santri s ON o.id_orangtua = s.id_orangtua 
JOIN presensi_santri ps ON s.id_santri = ps.id_santri
WHERE ps.kehadiran = 'hadir'
GROUP BY o.id_orangtua, s.id_santri
ORDER BY jumlah_kehadiran DESC;

# Tampilkan jumlah santri laki-laki dan perempuan di setiap masjid:
SELECT m.nama AS nama_masjid,  
       SUM(CASE WHEN s.gender = 'L' THEN 1 ELSE 0 END) AS jumlah_laki_laki,
       SUM(CASE WHEN s.gender = 'P' THEN 1 ELSE 0 END) AS jumlah_perempuan
FROM masjid m
LEFT JOIN jamaah j ON m.id_masjid = j.id_masjid 
LEFT JOIN santri s ON j.id_santri = s.id_santri
GROUP BY m.id_masjid;

# Tampilkan santri yang belum pernah absen pada tiap mata pelajaran:
SELECT s.nama, j.kegiatan
FROM santri s
JOIN presensi_santri ps ON s.id_santri = ps.id_santri
JOIN jadwal j ON ps.id_jadwal = j.id_jadwal
GROUP BY s.id_santri, j.id_jadwal  
HAVING SUM(CASE WHEN ps.kehadiran IN ('izin','alpa') THEN 1 ELSE 0 END) = 0;

# Tampilkan rangking hafalan kitab oleh santri:
SELECT s.nama, COUNT(h.id_hatam) AS jumlah_dihafalkan 
FROM santri s
LEFT JOIN hatam h ON s.id_santri = h.id_santri
GROUP BY s.id_santri
ORDER BY jumlah_dihafalkan DESC 
LIMIT 3;

# Tampilkan santri dengan kehadiran tertinggi di seluruh jadwal:
SELECT s.nama, SUM(CASE WHEN ps.kehadiran = 'hadir' THEN 1 ELSE 0 END) AS jumlah_hadir 
FROM santri s
JOIN presensi_santri ps ON s.id_santri = ps.id_santri
GROUP BY s.id_santri
ORDER BY jumlah_hadir DESC
LIMIT 3;

# Tampilkan pelajaran yang paling banyak kehadiran alfa dari santri:
SELECT j.kegiatan, SUM(CASE WHEN ps.kehadiran = 'izin' THEN 1 ELSE 0 END) AS total_izin
FROM presensi_santri ps
JOIN jadwal j ON ps.id_jadwal = j.id_jadwal
GROUP BY j.id_jadwal
ORDER BY total_izin DESC
LIMIT 3;

# Tampilkan guru dengan jumlah kehadiran tertinggi:
SELECT g.nama, COUNT(pg.id_guru) AS jumlah_hadir 
FROM guru g JOIN presensi_guru pg
ON g.id_guru = pg.id_guru
GROUP BY g.id_guru
ORDER BY jumlah_hadir DESC
LIMIT 3;

# Tampilkan masjid dengan kitab paling banyak dihapalkan:
SELECT m.nama, COUNT(h.id_hatam) AS total_hapalan
FROM masjid m
JOIN jamaah j ON m.id_masjid = j.id_masjid
JOIN santri s ON j.id_santri = s.id_santri
JOIN hatam h ON s.id_santri = h.id_santri
GROUP BY m.id_masjid  
ORDER BY total_hapalan DESC
LIMIT 3;

# Menampilkan data khatam di Masjid Al Ikhlas :
SELECT s.nama, h.*  
FROM santri s JOIN hatam h
ON s.id_santri = h.id_santri
JOIN jamaah j ON s.id_santri = j.id_santri
WHERE j.id_masjid = 'M003';
