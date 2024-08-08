<div class="box-title">
    <p>Beranda / <b>Produk Jualan</b></p>
</div>
<div id="box">
<h1>Pembayaran</h1>
<?php
    include 'lib/koneksi.php';

    $total = $_GET['jum'];
    $id = $_GET['id'];
    try {
      $conn ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $insert = $conn->prepare("INSERT INTO tbl_pesanan (id_user,id_barang,qty,kurir,date_in,total) SELECT id_user,id_barang,qty,kurir,date_in,total FROM tbl_keranjang WHERE id_user=:id");
      $insert->bindparam(':id', $id);
      $insert->execute();

      $delete = $conn->prepare("DELETE FROM tbl_keranjang WHERE id_user=:id");
      $delete->bindparam(':id', $id);
      $delete->execute();
      ?>
  <table class="article">
    <tr>
      <td>Status</td>
      <td><a class="tombol-biru">Pesanan Berhasil</a></td>
    </tr>
    <tr>
      <td>Jumlah Pembayaran</td>
      <td><b><?php echo "Rp. ".$total; ?></b></td>
    </tr>
    <tr>
      <td>Deskripsi</td>
      <td>
        Lakukan pembayaran dengan mentransfer nominal <b>Jumlah Pembayaran</b> pada rekening :<br>
        BANK MANDIRI<br>
        Rekening : 118-000-972525-9<br>
        A.N : kelompok 5<br>
        Referensi : bayar/id user/hijab <b>contoh : bayar/<?php echo $id."/hijab"; ?></b>
      </td>
    </tr>
    <tr>
      <td>Lanjutan</td>
      <td>
        Jika sudah melakukan pembayaran, segera <b>Konfirmasi Pembayaran</b> dengan mengirimkan bukti pembayaran di : <br>
        <b>WA</b> : 082248080870 <br>
        <b>LINE</b> : kelompok5keren
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        Terima kasih telah membeli barang di MyHijab <br>
        anda dapat melihat <a class="link" href="?page=belanja">Detail Pesanan</a>
      </td>
    </tr>
  </table>

   <?php
    } catch (PDOexception $e) {
      print "Added data failed: " . $e->getMessage() . "<br/>";
       die();
    }
 ?>
</div>
