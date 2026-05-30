<?php
session_start();

if (empty($_SESSION['user_id']) || $_SESSION['role'] !== 'candidate') {
    header('Location: ../../views/auth/login-signup.php#login');
    exit;
}

$firstname = htmlspecialchars($_SESSION['firstname']);
$lastname  = htmlspecialchars($_SESSION['lastname']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../public/css/candidate.css">
    <title>Candidate Dashboard</title>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="title">
                    <h1>University </h1><h1 class="elec">Election</h1>
                </div>
                <div class="right-nav">
                    <button id="logout-btn">
                        <a class="lgn-txt" href="../../../public/logout.php">Logout</a>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <section class="dashboard-sec">
        <div class="container">
            <div class="dash-container">
                <div class="sec-body">
                    <div class="left">
                        <div class="title">
                            <h1>Welcome, <?= $firstname ?>!</h1>
                            <div class="p">
                                <p>Running for: </p><p class="pos">Position</p>
                            </div>
                        </div>
                        <div class="body">
                            <div class="info">
                                <h3>Basic Information</h3>
                                <ul>
                                    <li><h3>Name:</h3><p><?= $firstname . ' ' . $lastname ?></p></li>
                                    <li><h3>Email Address:</h3><p><?= htmlspecialchars($_SESSION['email']) ?></p></li>
                                    <li><h3>Student ID:</h3><p><?= htmlspecialchars($_SESSION['loginID']) ?></p></li>
                                    <li><h3>Program:</h3><p>—</p></li>
                                    <li><h3>Department:</h3><p>—</p></li>
                                    <li><h3>Position:</h3><p>—</p></li>
                                    <li><h3>Party-List:</h3><p>—</p></li>
                                    <li><h3>Candidate Status:</h3><h5>Pending</h5></li>
                                </ul>
                            </div>
                            <div class="profile-pic">
                                <h3>Profile</h3>
                                <div class="img-container">
                                    <img src="../../../public/img/478589759275824754.png" alt="profile-pic">
                                </div>
                                <button id="edit-btn">Edit Profile</button>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <h3>Quick Actions</h3>
                        <div class="actions">
                            <div class="action-card">
                                <div class="top"><img src="" alt="img"><h3>Submit Requirements</h3></div>
                                <p>Upload required documents for your candidacy</p>
                                <button>Submit</button>
                            </div>
                            <div class="action-card">
                                <div class="top"><img src="" alt="img"><h3>View Candidates</h3></div>
                                <p>See other candidates in the election</p>
                                <button>View</button>
                            </div>
                            <div class="action-card">
                                <div class="top"><img src="" alt="img"><h3>Edit Profile</h3></div>
                                <p>Update your campaign details and profile photo</p>
                                <button>Edit Profile</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>