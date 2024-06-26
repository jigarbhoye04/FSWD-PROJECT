import React, { useEffect } from "react";
import "./revealer.css";

function Revealer() {
  useEffect(() => {
    document.addEventListener('DOMContentLoaded', () => {
      const revealerNav = window.revealer({
        revealElementSelector: '.nav-js',
        options: {
          anchorSelector: '.nav-btn-js',
        },
      });

      const actionBtn = document.querySelector('.nav-btn-js');
      actionBtn.addEventListener('click', () => {
        if (!revealerNav.isRevealed()) {
          revealerNav.reveal();
          actionBtn.setAttribute('data-open', true);
        } else {
          revealerNav.hide();
          actionBtn.setAttribute('data-open', false);
        }
      });
    });
  }, []);

  return (
    <>
      <header>
        <a href="#" className="logo">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 176.67 24.13"><path d="M20.06,24.13h-7.8l-6-9.28v9.28H0V0H9.76a9.68,9.68,0,0,1,3.52.59,6.94,6.94,0,0,1,2.48,1.62,6.76,6.76,0,0,1,1.47,2.37,8.22,8.22,0,0,1,.5,2.88,7,7,0,0,1-1.33,4.46,6.73,6.73,0,0,1-3.92,2.32ZM6.27,10.78H7.46A4.57,4.57,0,0,0,10.3,10a2.62,2.62,0,0,0,1-2.21,2.61,2.61,0,0,0-1-2.21,4.57,4.57,0,0,0-2.84-.77H6.27Z" /><path d="M38,5.31H30.56v4h7v5.32h-7v4.16H38v5.31H24.29V0H38Z" /><path d="M48.42,0l5.82,14.69L60.1,0h6.81L56.74,24.13h-5L41.6,0Z" /><path d="M107,24.13,101.12,9.45,95.27,24.13H88.45L98.63,0h5l10.14,24.12Z" /><path d="M84.77,5.31H77.31v4h7v5.32h-7v4.16h7.46v5.31H71V0H84.77Z" /><path d="M124.41,0V18.82h7.52v5.31H118.14V0Z" /><path d="M150.49,5.31H143v4h7v5.32h-7v4.16h7.45v5.31H136.77V0h13.72Z" /><path d="M176.67,24.13h-7.81l-6-9.28v9.28h-6.27V0h9.76a9.72,9.72,0,0,1,3.52.59,6.94,6.94,0,0,1,2.48,1.62,6.76,6.76,0,0,1,1.47,2.37,8.22,8.22,0,0,1,.49,2.88A7.1,7.1,0,0,1,173,11.92a6.76,6.76,0,0,1-3.92,2.32ZM162.88,10.78h1.18a4.59,4.59,0,0,0,2.85-.76,2.64,2.64,0,0,0,1-2.21,2.63,2.63,0,0,0-1-2.21,4.58,4.58,0,0,0-2.85-.77h-1.18Z" /></svg>
        </a>
        <div>
          <button className="header__button nav-btn-js" type="button"></button>
          <nav className="header__nav nav-js" data-active="false">
          <a href="#" class="logo logo--white">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 176.67 24.13"><path d="M20.06,24.13h-7.8l-6-9.28v9.28H0V0H9.76a9.68,9.68,0,0,1,3.52.59,6.94,6.94,0,0,1,2.48,1.62,6.76,6.76,0,0,1,1.47,2.37,8.22,8.22,0,0,1,.5,2.88,7,7,0,0,1-1.33,4.46,6.73,6.73,0,0,1-3.92,2.32ZM6.27,10.78H7.46A4.57,4.57,0,0,0,10.3,10a2.62,2.62,0,0,0,1-2.21,2.61,2.61,0,0,0-1-2.21,4.57,4.57,0,0,0-2.84-.77H6.27Z" /><path d="M38,5.31H30.56v4h7v5.32h-7v4.16H38v5.31H24.29V0H38Z" /><path d="M48.42,0l5.82,14.69L60.1,0h6.81L56.74,24.13h-5L41.6,0Z" /><path d="M107,24.13,101.12,9.45,95.27,24.13H88.45L98.63,0h5l10.14,24.12Z" /><path d="M84.77,5.31H77.31v4h7v5.32h-7v4.16h7.46v5.31H71V0H84.77Z" /><path d="M124.41,0V18.82h7.52v5.31H118.14V0Z" /><path d="M150.49,5.31H143v4h7v5.32h-7v4.16h7.45v5.31H136.77V0h13.72Z" /><path d="M176.67,24.13h-7.81l-6-9.28v9.28h-6.27V0h9.76a9.72,9.72,0,0,1,3.52.59,6.94,6.94,0,0,1,2.48,1.62,6.76,6.76,0,0,1,1.47,2.37,8.22,8.22,0,0,1,.49,2.88A7.1,7.1,0,0,1,173,11.92a6.76,6.76,0,0,1-3.92,2.32ZM162.88,10.78h1.18a4.59,4.59,0,0,0,2.85-.76,2.64,2.64,0,0,0,1-2.21,2.63,2.63,0,0,0-1-2.21,4.58,4.58,0,0,0-2.85-.77h-1.18Z" /></svg>
            </a>
            <ul className="header__menu">
              <li className="header__menu-item"><a href="#">Works</a></li>
              <li className="header__menu-item"><a href="#">News</a></li>
              <li className="header__menu-item"><a href="#">About</a></li>
              <li className="header__menu-item"><a href="#">Help</a></li>
              <li className="header__menu-item"><a href="#">Contacts</a></li>
            </ul>
          </nav>
        </div>
      </header>
      <h1>What a great nav menu with circular reveal animation?</h1>
      <footer>
        {/* <img src="https://www.freepnglogos.com/uploads/instagram-logo-png-transparent-background-hd-3.png" alt="Instagram" /> */}
      </footer>
    </>
  );
}

export {Revealer};
