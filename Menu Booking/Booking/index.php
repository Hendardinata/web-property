<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container" >
    <section class="main-left">
        <img src="AE.jpg" alt="" class="imgs">
    </section>
    <section class="main-right">
        <br>
        <h4>Menampilkan Data Perumahan</h4>

        <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="get">
        <div class="form-group">
            <label for="sel1">Select list:</label>
            <select class="form-control" name="nama_blok">
                <?php
                include "function.php";
                //Perintah sql untuk menampilkan semua data pada tabel perumahan
                $sql = "select * from tbl_perumahan";

                $hasil = mysqli_query($conn,$sql);
                $no=0;
                while ($data = mysqli_fetch_array($hasil)) {
                $no++;

                $ket="";
                if (isset($_GET['nama_blok'])) {
                    $perumahan = trim($_GET['nama_blok']);

                    if ($perumahan==$data['kode_perumahan'])
                    {
                        $ket="selected";
                    }
                }
                ?>
                <option <?php echo $ket; ?> value="<?php echo $data['kode_perumahan'];?>"><?php echo $data['nama_perumahan'];?></option>
                <?php
        }
        ?>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-info" value="Pilih">
        </div>
        </form>

        <table class="table table-bordered table-hover">
            <br>
            <thead style="text-align:center ;">
            <tr>
                <th>No</th>
                <th>ID</th>
                <th>Nama</th>
                <th>Blok</th>
                <th>Aksi</th>
            </tr>
            </thead>
            <?php


            if (isset($_GET['nama_blok'])) {
                $perumahan=trim($_GET['nama_blok']);
                $sql="select * from tbl_detail_perumahan where blok='$perumahan' order by id asc";
            }else {
                $sql="select * from tbl_detail_perumahan order by id asc";
            }


            $hasil=mysqli_query($conn,$sql);
            $no=0;
            while ($data = mysqli_fetch_array($hasil)) {
                $no++;

                ?>
                <tbody style="text-align: center;">
                <tr>
                    <td><?php echo $no;?></td>
                    <td><?php echo $data["id"]; ?></td>
                    <td><?php echo $data["nama"];   ?></td>
                    <td ><?php echo $data["blok"];   ?></td>
                    <td><input type="submit" class="btn btn-info" value="B">
                        <input type="submit" class="btn btn-warning" value="U">
                        <input type="submit" class="btn btn-danger" value="D">
                        </td>
                </tr>
                </tbody>
                <?php
            }
            ?>
        </table>
    </section>
</div>

</body>
</html>