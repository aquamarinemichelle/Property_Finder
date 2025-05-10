<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - ProperTY Real Estate</title>
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
    
    .register-container {
      max-width: 500px;
      margin: 60px auto;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 2px 15px rgba(44,22,24,0.09);
      padding: 40px;
    }
    
    .register-header {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .register-header h1 {
      font-size: 28px;
      margin: 0 0 10px 0;
    }
    
    .register-header p {
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
    
    .form-row {
      display: flex;
      gap: 15px;
    }
    
    .form-row .form-group {
      flex: 1;
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
    
    .register-footer {
      text-align: center;
      margin-top: 20px;
    }
    
    .register-footer a {
      color: #ac1c1a;
      text-decoration: none;
      font-weight: 500;
    }
    
    .register-footer a:hover {
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
    
    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 0;
      }
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

  <!-- Register Section -->
  <section class="register-container">
    <div class="register-header">
      <h1>Create an Account</h1>
      <p>Join ProperTY Real Estate today</p>
    </div>
    
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error-message">
      <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>
    
    <form id="registerForm" action="register" method="post">
<c:set var="selectedRole" value="${selectedRole != null ? selectedRole : 'customer'}" />

<div class="role-selector">
  <div class="role-option ${selectedRole == 'customer' ? 'selected' : ''}">
    <input type="radio" name="role" value="customer" ${selectedRole == 'customer' ? 'checked' : ''} />
    <h3>Customer</h3>
    <p>Browse and purchase properties</p>
  </div>
  <div class="role-option ${selectedRole == 'admin' ? 'selected' : ''}">
    <input type="radio" name="role" value="admin" ${selectedRole == 'admin' ? 'checked' : ''} />
    <h3>Admin</h3>
    <p>Manage properties and users</p>
  </div>
</div>
      
      <input type="hidden" id="role" name="role" value="customer">
      
      <div class="form-row">
        <div class="form-group">
          <label for="firstName">First Name</label>
          <input type="text" id="firstName" name="firstName" required>
        </div>
        
        <div class="form-group">
          <label for="lastName">Last Name</label>
          <input type="text" id="lastName" name="lastName" required>
        </div>
      </div>
      
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>
      </div>
      
      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" required>
      </div>
      
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required minlength="6">
      </div>
      
      <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required minlength="6">
      </div>
      
      <div class="form-actions">
        <button type="submit" class="button-main">Register</button>
      </div>
    </form>
    
    <div class="register-footer">
      <p>Already have an account? <a href="login.jsp">Login</a></p>
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

 <%
    String selectedRole = (String) session.getAttribute("selectedRole");
    if (selectedRole == null) {
        selectedRole = "customer"; // Default
    }
%>

<input type="hidden" name="role" value="<%= selectedRole %>">

</body>
</html>
