<?php
session_start();
require_once __DIR__ . '/../../config/config.php';
require_once __DIR__ . '/../../config/db.php';

// بررسی نقش کاربر (فقط مدیران می‌توانند کاربران را حذف کنند و نقش تغییر دهند)
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
  die("Access Denied");
}

// دریافت لیست کاربران از دیتابیس
$users = db_query("SELECT id, username, email, is_online, role FROM users");

// حذف کاربر در صورت ارسال درخواست حذف و بررسی دسترسی مدیر
if (isset($_POST['delete_user'])) {
  $user_id = intval($_POST['user_id']);
  db_query("DELETE FROM users WHERE id = ?", [$user_id]);
  header("Location: users.php");
  exit;
}

// تغییر نقش کاربر
if (isset($_POST['change_role'])) {
  $user_id = intval($_POST['user_id']);
  $new_role = $_POST['role'];
  db_query("UPDATE users SET role = ? WHERE id = ?", [$new_role, $user_id]);
  header("Location: users.php");
  exit;
}

// تغییر نقش کاربر (فقط برای ادمین‌ها)
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['change_role'])) {
  if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    die("Access Denied");
  }

  $user_id = intval($_POST['user_id']);
  $new_role = $_POST['role'];

  // اطمینان از اینکه مقدار `role` فقط `admin` یا `user` است
  if (!in_array($new_role, ['user', 'admin'])) {
    die("Invalid Role");
  }

  db_query("UPDATE users SET role = ? WHERE id = ?", [$new_role, $user_id]);

  // هدایت مجدد برای نمایش تغییرات
  header("Location: users.php");
  exit;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../assets/img/favicon.png">
  <title>
    Soft UI Dashboard 3 by Creative Tim
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- CSS Files -->
  <link id="pagestyle" href="../../assets/css/soft-ui-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">
  <?php include 'sidebar.php'; ?>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">


        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
          </ol>
          <h6 class="font-weight-bolder mb-0">Dashboard</h6>
        </nav>

        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">

          </div>
          <ul class="navbar-nav  justify-content-end">


            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>

          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->




    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>Users Table</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Username</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Role</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Management</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($users): ?>
                      <?php foreach ($users as $user): ?>
                        <tr>

                          <td>
                            <div class="d-flex px-2 py-1">
                              <div class="d-flex flex-column justify-content-center">
                                <h6 class="mb-0 text-sm"><?= htmlspecialchars($user['username']) ?></h6>
                                <p class="text-xs text-secondary mb-0"><?= htmlspecialchars($user['email']) ?></p>
                              </div>
                            </div>
                          </td>

                          <td class="align-middle text-center text-sm">
                            <?php if (!empty($user['is_online']) && $user['is_online'] == 1): ?>
                              <span class="badge badge-sm bg-gradient-success">Online</span>
                            <?php else: ?>
                              <span class="badge badge-sm bg-gradient-secondary">Offline</span>
                            <?php endif; ?>
                          </td>

                          <td class="align-middle text-center">
                            <?php if ($_SESSION['role'] === 'admin'): ?>
                              <form method="POST" action="users.php">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <select name="role" class="form-select text-xs font-weight-bold" onchange="this.form.submit()">
                                  <option value="user" <?= $user['role'] == 'user' ? 'selected' : '' ?>>User</option>
                                  <option value="admin" <?= $user['role'] == 'admin' ? 'selected' : '' ?>>Admin</option>
                                  <option value="author" <?= $user['role'] == 'author' ? 'selected' : '' ?>>Author</option>
                                </select>
                                <input type="hidden" name="change_role" value="1">
                              </form>
                            <?php else: ?>
                              <span class="text-secondary text-xs font-weight-bold"><?= htmlspecialchars($user['role']) ?></span>
                            <?php endif; ?>
                          </td>

                          <td class="align-middle text-center">
                            <span class="text-secondary text-xs font-weight-bold"></span>
                          </td>
                          <td class="align-middle text-center">
                            <?php if ($_SESSION['role'] === 'admin'): ?>
                              <form method="POST" style="display:inline;">
                                <input type="hidden" name="user_id" value="<?= $user['id'] ?>">
                                <button type="submit" name="delete_user" class="text-secondary font-weight-bold text-xs bg-transparent border-0 text-danger">
                                  Delete
                                </button>
                              </form>
                            <?php endif; ?>
                          </td>
                        </tr>
                      <?php endforeach; ?>
                    <?php else: ?>
                      <tr>
                        <td colspan="5" class="text-center">No users found.</td>
                      </tr>
                    <?php endif; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg ">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Soft UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn btn-primary w-100 px-3 mb-2 active" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn btn-primary w-100 px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="mt-3">
          <h6 class="mb-0">Navbar Fixed</h6>
        </div>
        <div class="form-check form-switch ps-0">
          <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
        </div>
        <hr class="horizontal dark my-sm-4">
        <a class="btn bg-gradient-dark w-100" href="https://www.creative-tim.com/product/soft-ui-dashboard">Free Download</a>
        <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/license/soft-ui-dashboard">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="https://github.com/creativetimofficial/soft-ui-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/soft-ui-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="https://twitter.com/intent/tweet?text=Check%20Soft%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/soft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../../assets/js/core/popper.min.js"></script>
  <script src="../../assets/js/core/bootstrap.min.js"></script>
  <script src="../../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.1.0"></script>
</body>

</html>