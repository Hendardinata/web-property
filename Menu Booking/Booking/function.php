<?php

    $conn = mysqli_connect("localhost","root","","muaraalam");

    $sql = mysqli_query($conn, "SELECT MAX(nama) as maxID from tbl_detail_perumahan");
    $data = mysqli_fetch_array($sql);

    $kode = $data['maxID'];

    $kode++;
    $ket = "";
    $kodeauto = $ket . sprintf("%01s",$kode);

    $kodeauto;

?>