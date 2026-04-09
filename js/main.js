/* ============================================================
   AceComfort — Main JavaScript
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

  /* ---------- Sticky Header Shadow ---------- */
  const header = document.querySelector('.site-header');
  if (header) {
    window.addEventListener('scroll', () => {
      header.classList.toggle('scrolled', window.scrollY > 20);
    });
  }

  /* ---------- Mobile Menu Toggle ---------- */
  const toggle = document.querySelector('.menu-toggle');
  const navMenu = document.querySelector('.nav-menu');
  if (toggle && navMenu) {
    toggle.addEventListener('click', () => {
      const isOpen = navMenu.classList.toggle('open');
      toggle.setAttribute('aria-expanded', isOpen);
      document.body.style.overflow = isOpen ? 'hidden' : '';
    });
  }

  /* ---------- Mobile Dropdown Toggle ---------- */
  document.querySelectorAll('.nav-item').forEach(item => {
    const link = item.querySelector('.nav-link');
    const dropdown = item.querySelector('.dropdown');
    if (!dropdown) return;
    link.addEventListener('click', e => {
      if (window.innerWidth <= 768) {
        e.preventDefault();
        item.classList.toggle('open');
      }
    });
  });

  /* ---------- Close mobile menu on outside click ---------- */
  document.addEventListener('click', e => {
    if (navMenu && navMenu.classList.contains('open')) {
      if (!e.target.closest('.navbar')) {
        navMenu.classList.remove('open');
        document.body.style.overflow = '';
      }
    }
  });

  /* ---------- FAQ Accordion ---------- */
  document.querySelectorAll('.faq-question').forEach(btn => {
    btn.addEventListener('click', () => {
      const item = btn.closest('.faq-item');
      const isOpen = item.classList.contains('open');
      // Close all
      document.querySelectorAll('.faq-item.open').forEach(i => i.classList.remove('open'));
      if (!isOpen) item.classList.add('open');
    });
  });

  /* ---------- Smooth Scroll for anchor links ---------- */
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener('click', e => {
      const target = document.querySelector(a.getAttribute('href'));
      if (target) {
        e.preventDefault();
        const offset = 90;
        const top = target.getBoundingClientRect().top + window.scrollY - offset;
        window.scrollTo({ top, behavior: 'smooth' });
      }
    });
  });

  /* ---------- Active Nav Link ---------- */
  const currentPath = window.location.pathname.replace(/\/$/, '') || '/';
  document.querySelectorAll('.nav-link').forEach(link => {
    const href = link.getAttribute('href');
    if (href && currentPath.endsWith(href.replace(/\/$/, ''))) {
      link.classList.add('active');
    }
  });

  /* ---------- Intersection Observer — Animate on Scroll ---------- */
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });

  document.querySelectorAll('.card, .reason-card, .membership-card, .rebate-card, .testimonial-card, .service-card').forEach(el => {
    el.classList.add('fade-in');
    observer.observe(el);
  });

  /* ---------- Counter Animation ---------- */
  const counterObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        animateCounter(entry.target);
        counterObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.5 });

  document.querySelectorAll('.count-up').forEach(el => counterObserver.observe(el));

  function animateCounter(el) {
    const target = parseInt(el.getAttribute('data-target'), 10);
    const suffix = el.getAttribute('data-suffix') || '';
    const duration = 1800;
    const start = performance.now();
    function update(now) {
      const progress = Math.min((now - start) / duration, 1);
      const eased = 1 - Math.pow(1 - progress, 3);
      el.textContent = Math.round(eased * target) + suffix;
      if (progress < 1) requestAnimationFrame(update);
    }
    requestAnimationFrame(update);
  }

  /* ---------- Form Enhancement ---------- */
  const contactForm = document.querySelector('.contact-form form');
  if (contactForm) {
    contactForm.addEventListener('submit', e => {
      e.preventDefault();
      const btn = contactForm.querySelector('[type="submit"]');
      const original = btn.textContent;
      btn.textContent = 'Sending...';
      btn.disabled = true;
      // Simulate submission — replace with real backend / Formspree / etc.
      setTimeout(() => {
        btn.textContent = '✓ Message Sent!';
        btn.style.background = 'var(--green)';
        setTimeout(() => {
          btn.textContent = original;
          btn.disabled = false;
          btn.style.background = '';
          contactForm.reset();
        }, 3500);
      }, 1200);
    });
  }

  /* ---------- Floating CTA scroll visibility ---------- */
  const floatingCta = document.querySelector('.floating-cta');
  if (floatingCta) {
    window.addEventListener('scroll', () => {
      floatingCta.style.opacity = window.scrollY > 300 ? '1' : '0';
      floatingCta.style.pointerEvents = window.scrollY > 300 ? 'auto' : 'none';
    });
    floatingCta.style.opacity = '0';
    floatingCta.style.transition = 'opacity 0.3s ease';
  }

});

/* ---------- Fade-in CSS injection ---------- */
const style = document.createElement('style');
style.textContent = `
  .fade-in { opacity: 0; transform: translateY(20px); transition: opacity 0.6s ease, transform 0.6s ease; }
  .fade-in.visible { opacity: 1; transform: translateY(0); }
`;
document.head.appendChild(style);
