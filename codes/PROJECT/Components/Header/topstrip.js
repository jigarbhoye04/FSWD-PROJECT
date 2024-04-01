import React from "react";
import img1 from './Images_Logos/instagram.png';
import img2 from './Images_Logos/twitter.png';
import img3 from './Images_Logos/world-wide-web.png';
import "./topstrip.css";

function TopStrip() {
    return (
        <div className="topstrip">
            <p className="topstripname">JIIGRRAAA IPL 2024</p>
            <div className="logo-container">
                <p>Follow Us</p>
                <a href="https://www.instagram.com/iplt20" target="_blank" rel="noopener noreferrer">
                    <img src={img1} alt="Instagram" className="logo" />
                </a>
                <a href="https://twitter.com/IPL" target="_blank" rel="noopener noreferrer">
                    <img src={img2} alt="Twitter" className="logo" />
                </a>
                <a href="https://www.iplt20.com" target="_blank" rel="noopener noreferrer">
                    <img src={img3} alt="IPL Official Site" className="logo" />
                </a>
            </div>
        </div>
    );
}

export { TopStrip };
