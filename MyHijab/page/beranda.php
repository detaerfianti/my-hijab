<div class="box-title bg-info">
    <p>Beranda / <b>Produk Jualan</b></p>
</div>
<div id="box">

  <?php
  if (isset ($_SESSION['username']) == ""){ ?>
    <div class="pesan">
      <p>Silahkan masuk sebelum berbelanja, belum punya akun ?
      <a href="page/daftar.php" class="tombol-biru">Daftar Sekarang</a></p>
    </div>
  <?php } ?>

  <table>
  <tr>
  <?php
  include 'lib/koneksi.php';
  $no = 1;
  $query = $conn->prepare("SELECT * FROM tbl_barang");
  $query->execute();

  $data = $query->fetchAll();

  foreach ($data as $value) { ?>
    <td class="list">
      <img src="img/hijab/<?php echo $value['nama_image']; ?>" width="120">
    <br><?php echo $value['deskripsi']; ?>
    <br><b><?php echo "Rp.".$value['harga']; ?></b>
    <br>
    <?php

    $id = $value['id_barang'];
    $query = $conn->prepare("SELECT SUM(qty)AS jumlah FROM tbl_pesanan WHERE id_barang=:id");
    $query->bindparam(':id', $id);
    $query->execute();
    $data = $query->fetch(PDO::FETCH_OBJ);
    $hasil = $data->jumlah;

    $stok = $value['stok'];
    $sisa = ($stok-$hasil);
    ?>
    <button type="button">Stok : <?php
    if ($sisa > 0) echo $sisa;
    else echo "Habis";
    ?></button>
    <?php
    if ($sisa > 0){
    if (isset ($_SESSION['username']) != ""){ ?>
      <a class="link"href="?page=belanja_detail&id=<?php echo $value['id_barang']; ?>&st=<?php echo $sisa; ?>">Beli</a>
    <?php }} ?>
    </td>
  <?php
    if ($no%4 == 0) echo "</tr><tr>";
    $no++;
    } ?>
</tr>
</table>
</div>
