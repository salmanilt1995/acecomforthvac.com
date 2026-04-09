// Reusable Booking Modal — auto-injects into any page that includes this script
// Automatically intercepts all .btn links to contact.html and opens a modal instead
(function() {
  // Don't run on the contact page itself
  if (location.pathname.indexOf('contact.html') !== -1) return;

  var modalHTML = '' +
  '<div id="bookingModal" style="display:none;position:fixed;inset:0;z-index:9999;background:rgba(0,0,0,0.5);align-items:center;justify-content:center;padding:1rem;">' +
    '<div style="background:#fff;border-radius:16px;max-width:500px;width:100%;padding:2.5rem;position:relative;box-shadow:0 20px 60px rgba(0,0,0,0.3);max-height:90vh;overflow-y:auto;">' +
      '<button onclick="closeBookingModal()" style="position:absolute;top:1rem;right:1rem;background:none;border:none;font-size:1.5rem;cursor:pointer;color:#94a3b8;line-height:1;">&times;</button>' +
      '<h2 id="bookingModalTitle" style="font-size:1.35rem;font-weight:800;color:#0f2a4a;margin-bottom:0.25rem;">Book Now</h2>' +
      '<p style="color:#94a3b8;font-size:0.9rem;margin-bottom:1.5rem;">Fill out the form below and we\'ll get back to you shortly.</p>' +
      '<form id="bookingModalForm" style="display:flex;flex-direction:column;gap:1rem;">' +
        '<input type="hidden" id="bookingModalService" name="service" value="" />' +
        '<div>' +
          '<label style="display:block;font-size:0.85rem;font-weight:600;color:#0f2a4a;margin-bottom:0.35rem;">Full Name *</label>' +
          '<input type="text" name="name" required placeholder="John Smith" style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;box-sizing:border-box;" />' +
        '</div>' +
        '<div>' +
          '<label style="display:block;font-size:0.85rem;font-weight:600;color:#0f2a4a;margin-bottom:0.35rem;">Email *</label>' +
          '<input type="email" name="email" required placeholder="you@email.com" style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;box-sizing:border-box;" />' +
        '</div>' +
        '<div>' +
          '<label style="display:block;font-size:0.85rem;font-weight:600;color:#0f2a4a;margin-bottom:0.35rem;">Phone *</label>' +
          '<input type="tel" name="phone" required placeholder="(604) 000-0000" style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;box-sizing:border-box;" />' +
        '</div>' +
        '<div class="booking-dropdown">' +
          '<label style="font-size:0.85rem;font-weight:600;color:#0f2a4a;">Request Type</label>' +
          '<select name="requestType" required style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;box-sizing:border-box;">' +
            '<option value="Book an Appointment">Book an Appointment</option>' +
            '<option value="Submit Request">Submit Request</option>' +
          '</select>' +
        '</div>' +
        '<div>' +
          '<label style="display:block;font-size:0.85rem;font-weight:600;color:#0f2a4a;margin-bottom:0.35rem;">Address</label>' +
          '<input type="text" name="address" placeholder="123 Main St, Vancouver, BC" style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;box-sizing:border-box;" />' +
        '</div>' +
        '<div>' +
          '<label style="display:block;font-size:0.85rem;font-weight:600;color:#0f2a4a;margin-bottom:0.35rem;">Message (optional)</label>' +
          '<textarea name="message" rows="3" placeholder="Tell us about your system or issue..." style="width:100%;padding:0.75rem 1rem;border:1px solid #e2e8f0;border-radius:8px;font-size:0.95rem;outline:none;resize:vertical;box-sizing:border-box;"></textarea>' +
        '</div>' +
        '<button type="submit" class="btn btn-primary btn-lg" style="width:100%;justify-content:center;margin-top:0.5rem;">Submit Request</button>' +
        '<p style="font-size:0.75rem;color:#94a3b8;text-align:center;margin-top:0.25rem;">We\'ll call you back within 1 hour during business hours.</p>' +
      '</form>' +
    '</div>' +
  '</div>';

  // Inject modal into page
  var div = document.createElement('div');
  div.innerHTML = modalHTML;
  document.body.appendChild(div.firstChild);

  // Close on backdrop click
  document.getElementById('bookingModal').addEventListener('click', function(e) {
    if (e.target === this) closeBookingModal();
  });

  // Close on Escape
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') closeBookingModal();
  });

  // Store original form HTML for reset
  var originalFormHTML = document.getElementById('bookingModalForm').innerHTML;

  // Form submit
  document.getElementById('bookingModalForm').addEventListener('submit', function(e) {
    e.preventDefault();
    var name = this.querySelector('[name="name"]').value;
    var service = document.getElementById('bookingModalService').value;
    var requestType = this.querySelector('[name="requestType"]').value;
    this.innerHTML = '<div style="text-align:center;padding:2rem 0;">' +
      '<div style="font-size:2.5rem;margin-bottom:1rem;color:#16a34a;">&#10003;</div>' +
      '<h3 style="color:#0f2a4a;margin-bottom:0.5rem;">Thank You, ' + name + '!</h3>' +
      '<p style="color:#94a3b8;">We\'ve received your request' + (requestType ? ' for <strong>' + requestType.replace(/-/g, ' ') + '</strong>' : '') + (service ? ' regarding <strong>' + service + '</strong>' : '') + '. Our team will call you within 1 hour during business hours.</p>' +
      '<p style="font-weight:700;color:#e8500a;margin-top:1rem;">Or call us now: <a href="tel:6046363939" style="color:#e8500a;">(604) 636-3939</a></p>' +
      '</div>';
  });

  // Auto-intercept all .btn links that point to contact.html
  // Skip: nav links, footer links, nav-link class, floating-cta links
  document.addEventListener('click', function(e) {
    var link = e.target.closest('a');
    if (!link) return;
    var href = link.getAttribute('href') || '';
    // Only intercept links to contact.html
    if (href.indexOf('contact.html') === -1) return;
    // Only intercept CTA links and floating buttons
    if (!link.classList.contains('btn') && !link.classList.contains('float-btn')) return;
    // Skip main nav menu and footer text links, but keep page CTAs and floating CTAs
    if (link.closest('.navbar') || link.closest('.site-footer')) return;

    e.preventDefault();
    // Get button text as service context
    var btnText = link.textContent.replace(/[^\w\s]/g, '').trim();
    var title = btnText || 'Book Service';
    // Get page context for service field
    var h1 = document.querySelector('h1');
    var service = h1 ? h1.textContent.trim() : '';
    openBookingModal(title, service);
  });

  // Store form HTML for reset
  window._bookingFormHTML = originalFormHTML;
})();

function openBookingModal(title, service) {
  document.getElementById('bookingModalTitle').textContent = title || 'Book Now';
  document.getElementById('bookingModalService').value = service || '';
  // Reset form if it was submitted
  var form = document.getElementById('bookingModalForm');
  if (!form.querySelector('[name="name"]')) {
    form.innerHTML = window._bookingFormHTML;
    // Re-attach submit handler
    form.addEventListener('submit', function handler(e) {
      e.preventDefault();
      var name = this.querySelector('[name="name"]').value;
      var svc = document.getElementById('bookingModalService').value;
      var requestType = this.querySelector('[name="requestType"]').value;
      var typeLabel = requestType ? requestType.replace(/-/g, ' ') : '';
      this.innerHTML = '<div style="text-align:center;padding:2rem 0;">' +
        '<div style="font-size:2.5rem;margin-bottom:1rem;color:#16a34a;">&#10003;</div>' +
        '<h3 style="color:#0f2a4a;margin-bottom:0.5rem;">Thank You, ' + name + '!</h3>' +
        '<p style="color:#94a3b8;">We\'ve received your ' + (typeLabel ? '<strong>' + typeLabel + '</strong> request' : 'request') + (svc ? ' regarding <strong>' + svc + '</strong>' : '') + '. Our team will call you within 1 hour during business hours.</p>' +
        '<p style="font-weight:700;color:#e8500a;margin-top:1rem;">Or call us now: <a href="tel:6046363939" style="color:#e8500a;">(604) 636-3939</a></p>' +
        '</div>';
      this.removeEventListener('submit', handler);
    });
  }
  document.getElementById('bookingModal').style.display = 'flex';
  document.body.style.overflow = 'hidden';
}

function closeBookingModal() {
  document.getElementById('bookingModal').style.display = 'none';
  document.body.style.overflow = '';
}
