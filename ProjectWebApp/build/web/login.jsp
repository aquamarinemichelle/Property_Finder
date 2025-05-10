<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - ProperTY Real Estate</title>
  <!-- Google Fonts: Bricolage Grotesque or similar -->
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Bricolage Grotesque', Arial, sans-serif;
      color: #212a29;
      background: #f9f9f9;
      margin: 0;
    }
    
    .container {
      width: 90%;
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .header {
      background: #ac1c1a;
      color: #fff;
      padding: 24px 0;
    }
    
    .header-flex {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    
    .logo {
      height: 38px;
    }
    
    .nav a {
      color: #fff;
      text-decoration: none;
      margin: 0 14px;
      font-weight: 500;
      transition: opacity .2s;
    }
    
    .nav a:hover {
      opacity: 0.7;
    }
    
    .button-header {
      background: #fff;
      color: #ac1c1a;
      border-radius: 20px;
      padding: 8px 18px;
      font-weight: bold;
      text-decoration: none;
      transition: background 0.2s;
    }
    
    .button-header:hover {
      background: #ffe5e5;
    }
    
    .login-container {
      max-width: 500px;
      margin: 60px auto;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 2px 15px rgba(44,22,24,0.09);
      padding: 40px;
    }
    
    .login-header {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .login-header h1 {
      font-size: 28px;
      margin: 0 0 10px 0;
    }
    
    .login-header p {
      color: #95979b;
      margin: 0;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
    }
    
    .form-group input {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 16px;
      font-family: inherit;
      box-sizing: border-box;
    }
    
    .form-group input:focus {
      outline: none;
      border-color: #ac1c1a;
      box-shadow: 0 0 0 2px rgba(172, 28, 26, 0.2);
    }
    
    .form-actions {
      margin-top: 30px;
    }
    
    .button-main {
      background: #ac1c1a;
      color: #fff;
      border: none;
      padding: 12px 32px;
      border-radius: 32px;
      font-weight: 600;
      font-size: 18px;
      text-decoration: none;
      cursor: pointer;
      transition: background 0.2s;
      box-shadow: 0 3px 10px rgba(119,10,9,0.10);
      display: block;
      width: 100%;
      text-align: center;
    }
    
    .button-main:hover {
      background: #821615;
    }
    
    .login-footer {
      text-align: center;
      margin-top: 20px;
    }
    
    .login-footer a {
      color: #ac1c1a;
      text-decoration: none;
      font-weight: 500;
    }
    
    .login-footer a:hover {
      text-decoration: underline;
    }
    
    .role-selector {
      display: flex;
      gap: 15px;
      margin-bottom: 20px;
    }
    
    .role-option {
      flex: 1;
      padding: 15px;
      border: 2px solid #ddd;
      border-radius: 8px;
      text-align: center;
      cursor: pointer;
      transition: all 0.2s;
    }
    
    .role-option.selected {
      border-color: #ac1c1a;
      background-color: rgba(172, 28, 26, 0.05);
    }
    
    .role-option h3 {
      margin: 0 0 5px 0;
    }
    
    .role-option p {
      margin: 0;
      font-size: 14px;
      color: #95979b;
    }
    
    .error-message {
      color: #ac1c1a;
      background-color: rgba(172, 28, 26, 0.1);
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 20px;
      display: none;
    }
    
    /* Footer */
    .footer {
      background: #212a29;
      color: #fff;
      padding: 30px 0;
      margin-top: 60px;
    }
    
    .footer-bottom {
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 15px;
      color: #95979b;
    }
    
    .footer-bottom ul {
      display: flex;
      gap: 16px;
      list-style: none;
      margin: 0;
      padding: 0;
    }
    
    .footer-bottom a {
      color: #95979b;
      text-decoration: none;
      transition: color 0.16s;
    }
    
    .footer-bottom a:hover {
      color: #ac1c1a;
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header class="header">
    <div class="container header-flex">
      <a href="index.html">
        <img src="https://ext.same-assets.com/2277696494/3620348008.png" alt="ProperTY logo" class="logo">
      </a>
      <nav class="nav">
        <a href="index.html#categories">Categories</a>
        <a href="index.html#properties">Properties</a>
        <a href="index.html#featured">Featured</a>
        <a href="index.html#blog">Blog</a>
        <a href="index.html#faqs">FAQs</a>
      </nav>
      <div class="header-contact">
        <a href="tel:+2347038618692" class="button-header">+234 7038618692</a>
      </div>
    </div>
  </header>

  <!-- Login Section -->
  <section class="login-container">
    <div class="login-header">
      <h1>Welcome Back</h1>
      <p>Login to access your account</p>
    </div>
    
    <div id="errorMessage" class="error-message"></div>
    
    <form id="loginForm" action="login" method="POST">
      <div class="role-selector">
        <div class="role-option selected" data-role="customer">
          <h3>Customer</h3>
          <p>Browse and purchase properties</p>
        </div>
        <div class="role-option" data-role="admin">
          <h3>Admin</h3>
          <p>Manage properties and users</p>
        </div>
      </div>
      
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>
      </div>
      
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
      </div>
      
      <div class="form-actions">
        <button type="submit" class="button-main">Login</button>
      </div>
    </form>
    
    <div class="login-footer">
      <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container footer-bottom">
      <span>@2025 ProperTY</span>
      <ul>
        <li><a href="#">Terms of service</a></li>
        <li><a href="#">Privacy Policy</a></li>
      </ul>
    </div>
  </footer>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Role selector
      const roleOptions = document.querySelectorAll('.role-option');
      let selectedRole = 'customer';
      
      roleOptions.forEach(option => {
        option.addEventListener('click', function() {
          roleOptions.forEach(opt => opt.classList.remove('selected'));
          this.classList.add('selected');
          selectedRole = this.dataset.role;
        });
      });
      
      // Login form submission
      const loginForm = document.getElementById('loginForm');
      const errorMessage = document.getElementById('errorMessage');
      
      loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        
        // Get users from localStorage
        const users = JSON.parse(localStorage.getItem('users')) || [];
        
        // Find user with matching email and password
        const user = users.find(u => u.email === email && u.password === password && u.role === selectedRole);
        
        if (user) {
          // Store current user in localStorage (excluding password)
          const { password, ...userWithoutPassword } = user;
          localStorage.setItem('currentUser', JSON.stringify(userWithoutPassword));
          
          // Redirect to appropriate dashboard
          if (selectedRole === 'admin') {
            window.location.href = 'admin-dashboard.html';
          } else {
            window.location.href = 'customer-dashboard.html';
          }
        } else {
          // Show error message
          errorMessage.textContent = 'Invalid email or password. Please try again.';
          errorMessage.style.display = 'block';
        }
      });
    });
  </script>
</body>
</html>

