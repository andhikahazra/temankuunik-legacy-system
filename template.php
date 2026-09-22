<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Full Page Template</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
            /* Warna full page */
        }

        header,
        footer {
            padding: 20px;
            background-color: white;
        }

        header {
            border-bottom: 1px solid #ddd;
            /* Garis lembut di bawah header */
        }

        footer {
            border-top: 1px solid #ddd;
            /* Garis lembut di atas footer */
        }

        .content {
            padding: 40px;
            min-height: calc(100vh - 160px);
            /* Menyisakan ruang untuk header & footer */
        }

        .nav-item a {
            color: #333;
            /* Warna menu */
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="container-fluid">
        <div class="row justify-content-between align-items-center">
            <!-- Nama Website di Kiri -->
            <div class="col-auto">
                <h1 class="mb-0">Temanku Unik</h1>
            </div>

            <!-- Menu di Kanan -->
            <div class="col-auto">
                <nav>
                    <ul class="nav">
                        <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Content -->
    <div class="content text-center">
        <div class="container my-5">
            <h2 class="text-center">Buku Tamu</h2>

            <!-- Form -->
            <form>
                <!-- Nomor HP (Number) -->
                <div class="row mb-3">
                    <label for="phone" class="col-sm-3 col-form-label">Nomor HP</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="phone" name="phone" required>
                    </div>
                </div>

                <!-- Nama (Varchar 50) -->
                <div class="row mb-3">
                    <label for="name" class="col-sm-3 col-form-label">Nama</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" maxlength="50" required>
                    </div>
                </div>

                <!-- Email (Email) -->
                <div class="row mb-3">
                    <label for="email" class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </div>

                <!-- Instansi (Varchar 120) -->
                <div class="row mb-3">
                    <label for="institution" class="col-sm-3 col-form-label">Instansi</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="institution" name="institution" maxlength="120" required>
                    </div>
                </div>

                <!-- Keperluan (Dropdown) -->
                <div class="row mb-3">
                    <label for="purpose" class="col-sm-3 col-form-label">Keperluan</label>
                    <div class="col-sm-9">
                        <select class="form-select" id="purpose" name="purpose" required>
                            <option value="" disabled selected>Pilih keperluan</option>
                            <option value="Konsultasi">Konsultasi</option>
                            <option value="Pendaftaran">Pendaftaran</option>
                            <option value="Informasi">Informasi</option>
                            <option value="Lainnya">Lainnya</option>
                        </select>
                    </div>
                </div>

                <!-- Catatan (Text Area) -->
                <div class="row mb-3">
                    <label for="notes" class="col-sm-3 col-form-label">Catatan</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="notes" name="notes" rows="4"></textarea>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>

    </div>

    <!-- Footer -->
    <footer class="text-center">
        <p>&copy; 2024 Simple Website</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>