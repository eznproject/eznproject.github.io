
        // Smooth scroll
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Parallax effect for hero
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const hero = document.querySelector('.hero-text');
            const heroVisual = document.querySelector('.hero-visual');
            
            if (hero && heroVisual) {
                hero.style.transform = `translateY(${scrolled * 0.5}px)`;
                heroVisual.style.transform = `translateY(${scrolled * 0.3}px)`;
            }
        });

        // Intersection Observer for fade-in animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -100px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        // Add animation styles and observe elements
        document.addEventListener('DOMContentLoaded', () => {
            const animatedElements = document.querySelectorAll('.skill-card, .project-card, .about-text');
            
            animatedElements.forEach((el, index) => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(50px)';
                el.style.transition = `all 0.6s ease ${index * 0.1}s`;
                observer.observe(el);
            });
        });

        // Cursor trail effect
        const cursor = document.createElement('div');
        cursor.style.cssText = `
            position: fixed;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(157, 78, 221, 0.6), transparent);
            pointer-events: none;
            z-index: 9999;
            transition: transform 0.15s ease;
            mix-blend-mode: screen;
        `;
        document.body.appendChild(cursor);

        const cursorTrail = [];
        for (let i = 0; i < 5; i++) {
            const trail = document.createElement('div');
            trail.style.cssText = `
                position: fixed;
                width: ${15 - i * 2}px;
                height: ${15 - i * 2}px;
                border-radius: 50%;
                background: radial-gradient(circle, rgba(0, 212, 255, ${0.4 - i * 0.08}), transparent);
                pointer-events: none;
                z-index: 9998;
                mix-blend-mode: screen;
            `;
            document.body.appendChild(trail);
            cursorTrail.push(trail);
        }

        let mouseX = 0, mouseY = 0;
        let cursorX = 0, cursorY = 0;
        const trailPositions = Array(5).fill().map(() => ({ x: 0, y: 0 }));

        document.addEventListener('mousemove', (e) => {
            mouseX = e.clientX;
            mouseY = e.clientY;
        });

        function animateCursor() {
            const ease = 0.15;
            cursorX += (mouseX - cursorX) * ease;
            cursorY += (mouseY - cursorY) * ease;
            
            cursor.style.left = cursorX - 10 + 'px';
            cursor.style.top = cursorY - 10 + 'px';

            for (let i = 0; i < cursorTrail.length; i++) {
                const prev = i === 0 ? { x: cursorX, y: cursorY } : trailPositions[i - 1];
                trailPositions[i].x += (prev.x - trailPositions[i].x) * (ease - i * 0.02);
                trailPositions[i].y += (prev.y - trailPositions[i].y) * (ease - i * 0.02);
                
                cursorTrail[i].style.left = trailPositions[i].x - (15 - i * 2) / 2 + 'px';
                cursorTrail[i].style.top = trailPositions[i].y - (15 - i * 2) / 2 + 'px';
            }

            requestAnimationFrame(animateCursor);
        }
        animateCursor();

        // Typing animation for hero text
        const heroTitle = document.querySelector('.hero-text h1');
        if (heroTitle) {
            const originalText = heroTitle.innerHTML;
            heroTitle.innerHTML = '';
            let charIndex = 0;
            
            function typeWriter() {
                if (charIndex < originalText.length) {
                    heroTitle.innerHTML += originalText.charAt(charIndex);
                    charIndex++;
                    setTimeout(typeWriter, 50);
                }
            }
            
            setTimeout(typeWriter, 500);
        }

        // Floating animation for profile container
        const profileContainer = document.querySelector('.profile-container');
        if (profileContainer) {
            let floatY = 0;
            let floatDirection = 1;
            
            function floatAnimation() {
                floatY += 0.5 * floatDirection;
                if (floatY > 20 || floatY < -20) floatDirection *= -1;
                profileContainer.style.transform = `translateY(${floatY}px) scale(1.02)`;
                requestAnimationFrame(floatAnimation);
            }
            floatAnimation();
        }

        // Card tilt effect
        document.querySelectorAll('.skill-card, .project-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const centerX = rect.width / 2;
                const centerY = rect.height / 2;
                
                const rotateX = (y - centerY) / 10;
                const rotateY = (centerX - x) / 10;
                
                card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
            });
            
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateY(0)';
            });
        });

        // Random particles
        const particlesContainer = document.createElement('div');
        particlesContainer.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        `;
        document.body.appendChild(particlesContainer);

        for (let i = 0; i < 30; i++) {
            const particle = document.createElement('div');
            particle.style.cssText = `
                position: absolute;
                width: ${Math.random() * 3 + 1}px;
                height: ${Math.random() * 3 + 1}px;
                background: ${Math.random() > 0.5 ? '#9D4EDD' : '#00D4FF'};
                border-radius: 50%;
                left: ${Math.random() * 100}%;
                top: ${Math.random() * 100}%;
                opacity: ${Math.random() * 0.5 + 0.2};
                animation: float ${Math.random() * 10 + 5}s infinite ease-in-out;
            `;
            particlesContainer.appendChild(particle);
        }

        // Add float animation keyframes
        const style = document.createElement('style');
        style.textContent = `
            @keyframes float {
                0%, 100% { transform: translateY(0px) translateX(0px); }
                25% { transform: translateY(-20px) translateX(10px); }
                50% { transform: translateY(-40px) translateX(-10px); }
                75% { transform: translateY(-20px) translateX(5px); }
            }
        `;
        document.head.appendChild(style);

        // Button ripple effect
        document.querySelectorAll('.btn-primary, .btn-secondary').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.6);
                    left: ${x}px;
                    top: ${y}px;
                    transform: scale(0);
                    animation: ripple 0.6s ease-out;
                    pointer-events: none;
                `;
                
                this.style.position = 'relative';
                this.style.overflow = 'hidden';
                this.appendChild(ripple);
                
                setTimeout(() => ripple.remove(), 600);
            });
        });

        const rippleStyle = document.createElement('style');
        rippleStyle.textContent = `
            @keyframes ripple {
                to { transform: scale(4); opacity: 0; }
            }
        `;
        document.head.appendChild(rippleStyle);

        // Nav background on scroll
        const nav = document.querySelector('nav');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 100) {
                nav.style.background = 'rgba(10, 10, 15, 0.95)';
                nav.style.boxShadow = '0 10px 30px rgba(157, 78, 221, 0.2)';
            } else {
                nav.style.background = 'rgba(10, 10, 15, 0.9)';
                nav.style.boxShadow = 'none';
            }
        });

        // Social links hover effect
        document.querySelectorAll('.social-link').forEach(link => {
            link.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px) rotate(360deg)';
            });
            link.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) rotate(0deg)';
            });
        });
