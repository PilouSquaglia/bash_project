<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css.css">
    <title>ttt</title>
</head>
<body>
    <div class="container-lg">
        <div class="container-lg text-center" style="max-width: 600px;">
            <div class="card text-center">
                <div class="card-header">
                    <?php echo $res['title'] ?>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $res['title'] ?></h5>
                    <img src=<?php echo $res['file_name'] ?> class="card-img-top" alt="...">
                    <p class="card-text"><?php echo $res['description'] ?></p>

                    <a href="index.php?page=profileAmi&id=<?php echo $res['id_user'] ?>&friend=no" class="btn btn-primary"><?php echo $res['nom'] ?> - <?php echo $res['prenom'] ?></a>
                </div>
                <div class="card-footer text-muted">
                    Date of the post: <?php echo $res['uploaded_on'] ?>
                </div>
            </div>
        </div>
    </div>
    <br>
</body>
</html>