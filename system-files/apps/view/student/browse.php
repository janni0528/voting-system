<?php
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'student') {
    header('Location: ../auth/login-signup.php#login');
    exit;
}

$firstname = htmlspecialchars($_SESSION['firstname']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../public/css/student.css">
    <title>Browse</title>
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

    <section class="hero-section-student">
        <div class="container">
            <div class="hero-stud-container">
                <div class="hero-stud-text">
                    <h1>Welcome, <?= $firstname ?>!</h1>
                    <p>Participate in shaping the university's tomorrow. Vote securely for your preferred candidate.</p>
                </div>
                <a href="voting.html"><button>Cast Your Vote</button></a>
                <button id="export-btn">Export Ballot</button>
            </div>
        </div>
    </section>

    <section class="current-standings-sec">
        <div class="container">
            <div class="cs-container">
                <div class="cs-text">
                    <h1>Current Standings</h1>
                    <p>Real-time standings. Data refreshes every hour.</p>
                </div>
                <div class="graph-container">
                    <div class="graph"></div>
                    <div class="graph"></div>
                </div>
                <div class="cs-pagination">
                    <ul>
                        <li><button class="prev">PREV</button></li>
                        <li><button class="pg active">1</button></li>
                        <li><button class="pg">2</button></li>
                        <li><button class="pg">3</button></li>
                        <li><button class="next">NEXT</button></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="candidate-highlight-sec">
        <div class="container">
            <div class="cand-high-container">
                <div class="cand-high-title">
                    <h1>Candidate Highlights</h1>
                    <div class="line"></div>
                </div>
                <div class="cand-high-cards">
                    <div class="ch-card">
                        <div class="head-card">
                            <div class="prof">
                                <img src="" alt="img">
                                <div class="details"><h1>Name</h1><h3>Position</h3></div>
                            </div>
                            <div class="tags"><ul><li><p>achievement 1</p></li><li><p>achievement 2</p></li><li><p>achievement 3</p></li></ul></div>
                        </div>
                        <div class="body-card">
                            <div class="details"><h3>Party-list</h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p></div>
                            <button>View Profile</button>
                        </div>
                    </div>
                    <div class="ch-card">
                        <div class="head-card">
                            <div class="prof">
                                <img src="" alt="img">
                                <div class="details"><h1>Name</h1><h3>Position</h3></div>
                            </div>
                            <div class="tags"><ul><li><p>achievement 1</p></li><li><p>achievement 2</p></li><li><p>achievement 3</p></li></ul></div>
                        </div>
                        <div class="body-card">
                            <div class="details"><h3>Party-list</h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p></div>
                            <button>View Profile</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="all-candidates-sec">
        <div class="container">
            <div class="all-cand-container">
                <div class="all-cand-title">
                    <h1>All Candidates</h1>
                    <div class="line"></div>
                </div>
                <div class="all-cand-body">
                    <nav>
                        <div class="custom-select">
                            <select name="position" id="position-filter">
                                <option value="">All Positions</option>
                                <option value="president">President</option>
                                <option value="vice-president">Vice President</option>
                                <option value="secretary">Secretary</option>
                                <option value="treasurer">Treasurer</option>
                                <option value="auditor">Auditor</option>
                            </select>
                            <span class="custom-arrow"></span>
                        </div>
                        <h3>No. of Candidates</h3>
                    </nav>
                    <div class="all-cand-cards">
                        <div class="ac-card">
                            <div class="prof">
                                <img src="" alt="img">
                                <div class="details"><h1>Candidate Name</h1><h3>Position</h3></div>
                            </div>
                            <button>View Profile</button>
                        </div>
                        <div class="ac-card">
                            <div class="prof">
                                <img src="" alt="img">
                                <div class="details"><h1>Candidate Name</h1><h3>Position</h3></div>
                            </div>
                            <button>View Profile</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>