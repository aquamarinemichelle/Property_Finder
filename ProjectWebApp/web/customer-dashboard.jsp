<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard - ProperTY Real Estate</title>
  <!-- Google Fonts: Bricolage Grotesque or similar -->
  <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
  <style>
    .dashboard-container {
      padding: 40px 0;
    }
    
    .dashboard-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }
    
    .dashboard-title {
      font-size: 32px;
      margin: 0;
    }
    
    .dashboard-tabs {
      display: flex;
      gap: 10px;
      margin-bottom: 30px;
      border-bottom: 1px solid #ddd;
    }
    
    .dashboard-tab {
      padding: 12px 20px;
      cursor: pointer;
      font-weight: 500;
      border-bottom: 3px solid transparent;
    }
    
    .dashboard-tab.active {
      border-bottom: 3px solid #ac1c1a;
      color: #ac1c1a;
    }
    
    .dashboard-content {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      padding: 30px;
    }
    
    .property-list {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 20px;
    }
    
    .property-actions {
      display: flex;
      gap: 10px;
      margin-top: 15px;
    }
    
    .btn-edit, .btn-delete, .btn-view {
      padding: 8px 12px;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
      border: none;
      font-weight: 500;
    }
    
    .btn-edit {
      background: #f0f0f0;
      color: #333;
    }
    
    .btn-delete {
      background: #ffeeee;
      color: #ac1c1a;
    }
    
    .btn-view {
      background: #eef5ff;
      color: #0066cc;
    }
    
    .empty-state {
      text-align: center;
      padding: 50px 0;
    }
    
    .empty-state img {
      width: 120px;
      margin-bottom: 20px;
      opacity: 0.7;
    }
    
    /* Form Styles */
    .property-form {
      max-width: 800px;
      margin: 0 auto;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
    }
    
    .form-group input, .form-group textarea, .form-group select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 16px;
      font-family: inherit;
    }
    
    .form-row {
      display: flex;
      gap: 20px;
    }
    
    .form-row .form-group {
      flex: 1;
    }
    
    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 15px;
      margin-top: 30px;
    }
    
    .btn-cancel {
      background: #f0f0f0;
      color: #333;
      border: none;
      padding: 12px 24px;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 500;
    }
    
    /* Modal Styles */
    .modal-overlay {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0,0,0,0.5);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 1000;
      display: none;
    }
    
    .modal {
      background: white;
      border-radius: 15px;
      width: 90%;
      max-width: 500px;
      padding: 30px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }
    
    .modal-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .modal-title {
      font-size: 24px;
      margin: 0;
    }
    
    .modal-close {
      background: none;
      border: none;
      font-size: 24px;
      cursor: pointer;
    }
    
    .modal-actions {
      display: flex;
      justify-content: flex-end;
      gap: 15px;
      margin-top: 30px;
    }
  </style>
</head>
<body>
  <!-- Header -->
  <header class="header">
    <div class="container header-flex">
      <img src="https://ext.same-assets.com/2277696494/3620348008.png" alt="ProperTY logo" class="logo">
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

  <!-- Dashboard Section -->
  <section class="dashboard-container">
    <div class="container">
      <div class="dashboard-header">
        <h1 class="dashboard-title">My Properties</h1>
        <a href="add-property.html" class="button-main">Add New Property</a>
      </div>
      
      <div class="dashboard-tabs">
        <div class="dashboard-tab active" data-tab="all">All Properties</div>
        <div class="dashboard-tab" data-tab="published">Published</div>
        <div class="dashboard-tab" data-tab="draft">Drafts</div>
      </div>
      
      <div class="dashboard-content">
        <div class="property-list" id="propertyList">
          <!-- Properties will be loaded here via JavaScript -->
        </div>
        
        <div class="empty-state" id="emptyState" style="display: none;">
          <img src="https://ext.same-assets.com/2277696494/998408551.svg" alt="No properties">
          <h3>No properties found</h3>
          <p>You haven't added any properties yet. Click the button above to add your first property.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Delete Confirmation Modal -->
  <div class="modal-overlay" id="deleteModal">
    <div class="modal">
      <div class="modal-header">
        <h2 class="modal-title">Confirm Deletion</h2>
        <button class="modal-close" id="closeDeleteModal">&times;</button>
      </div>
      <p>Are you sure you want to delete this property? This action cannot be undone.</p>
      <div class="modal-actions">
        <button class="btn-cancel" id="cancelDelete">Cancel</button>
        <button class="button-main" id="confirmDelete">Delete Property</button>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container footer-grid">
      <div class="footer-newsletter">
        <h3>Stay updated with the latest news, promotions, and exclusive offers.</h3>
        <form action="#" class="newsletter-form">
          <input type="email" placeholder="Your email address" required />
          <button class="button-main" type="submit">Subscribe</button>
        </form>
        <p class="newsletter-terms">By subscribing, you agree to receive our promotional emails. You can unsubscribe at any time.</p>
      </div>
      <div class="footer-links">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="index.html#categories">Categories</a></li>
          <li><a href="index.html#properties">Properties</a></li>
          <li><a href="index.html#featured">Featured Property</a></li>
          <li><a href="index.html#blog">Blog</a></li>
          <li><a href="index.html#faqs">FAQs</a></li>
        </ul>
      </div>
      <div class="footer-social">
        <a href="#"><img src="https://ext.same-assets.com/2277696494/1576975013.svg" alt="Facebook"></a>
      </div>
    </div>
    <div class="footer-bottom container">
      <span>@2025 ProperTY</span>
      <ul>
        <li><a href="#">Terms of service</a></li>
        <li><a href="#">Privacy Policy</a></li>
      </ul>
    </div>
  </footer>

  <script>
    // Sample property data (in a real application, this would come from a server)
    let properties = JSON.parse(localStorage.getItem('properties')) || [
      {
        id: 1,
        title: "Serenity Height Villas",
        address: "15 S Aurora Ave, Miami",
        price: 570000,
        bedrooms: 4,
        bathrooms: 3,
        area: 120,
        type: "Villa",
        status: "published",
        description: "Beautiful villa with amazing views",
        imageUrl: "https://ext.same-assets.com/2277696494/1235839442.png"
      },
      {
        id: 2,
        title: "Modern Apartment",
        address: "25 Ocean Drive, Miami",
        price: 350000,
        bedrooms: 2,
        bathrooms: 2,
        area: 85,
        type: "Apartment",
        status: "published",
        description: "Cozy apartment in the heart of the city",
        imageUrl: "https://ext.same-assets.com/2277696494/1235839442.png"
      }
    ];
    
    // Save initial data if not already saved
    if (!localStorage.getItem('properties')) {
      localStorage.setItem('properties', JSON.stringify(properties));
    }
    
    // DOM Elements
    const propertyList = document.getElementById('propertyList');
    const emptyState = document.getElementById('emptyState');
    const tabs = document.querySelectorAll('.dashboard-tab');
    const deleteModal = document.getElementById('deleteModal');
    const closeDeleteModal = document.getElementById('closeDeleteModal');
    const cancelDelete = document.getElementById('cancelDelete');
    const confirmDelete = document.getElementById('confirmDelete');
    
    let currentTab = 'all';
    let propertyToDelete = null;
    
    // Display properties based on selected tab
    function displayProperties() {
      const filteredProperties = currentTab === 'all' 
        ? properties 
        : properties.filter(property => property.status === currentTab);
      
      if (filteredProperties.length === 0) {
        propertyList.innerHTML = '';
        emptyState.style.display = 'block';
      } else {
        emptyState.style.display = 'none';
        propertyList.innerHTML = filteredProperties.map(property => `
          <div class="property-card">
            <img src="${property.imageUrl}" alt="${property.title}">
            <div class="property-details">
              <h3>${property.title}</h3>
              <p class="address">${property.address}</p>
              <div class="property-meta">
                <span class="price">$${property.price.toLocaleString()}</span>
                <span><img src="https://ext.same-assets.com/2277696494/1741873214.svg" alt="Bed"> ${property.bedrooms}</span>
                <span><img src="https://ext.same-assets.com/2277696494/12998126.svg" alt="Bath"> ${property.bathrooms}</span>
                <span><img src="https://ext.same-assets.com/2277696494/1277346858.svg" alt="Area"> ${property.area}m²</span>
              </div>
              <div class="property-actions">
                <button class="btn-view" onclick="viewProperty(${property.id})">View</button>
                <button class="btn-edit" onclick="editProperty(${property.id})">Edit</button>
                <button class="btn-delete" onclick="showDeleteModal(${property.id})">Delete</button>
              </div>
            </div>
          </div>
        `).join('');
      }
    }
    
    // Tab switching
    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        tabs.forEach(t => t.classList.remove('active'));
        tab.classList.add('active');
        currentTab = tab.dataset.tab;
        displayProperties();
      });
    });
    
    // View property details
    function viewProperty(id) {
      window.location.href = `view-property.html?id=${id}`;
    }
    
    // Edit property
    function editProperty(id) {
      window.location.href = `edit-property.html?id=${id}`;
    }
    
    // Show delete confirmation modal
    function showDeleteModal(id) {
      propertyToDelete = id;
      deleteModal.style.display = 'flex';
    }
    
    // Close delete modal
    closeDeleteModal.addEventListener('click', () => {
      deleteModal.style.display = 'none';
    });
    
    cancelDelete.addEventListener('click', () => {
      deleteModal.style.display = 'none';
    });
    
    // Confirm delete
    confirmDelete.addEventListener('click', () => {
      if (propertyToDelete) {
        properties = properties.filter(property => property.id !== propertyToDelete);
        localStorage.setItem('properties', JSON.stringify(properties));
        displayProperties();
        deleteModal.style.display = 'none';
      }
    });
    
    // Close modal when clicking outside
    window.addEventListener('click', (e) => {
      if (e.target === deleteModal) {
        deleteModal.style.display = 'none';
      }
    });
    
    // Initial display
    displayProperties();
  </script>
</body>
</html>