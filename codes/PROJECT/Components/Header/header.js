import React from "react";
import "./header.css";
import img1 from './Images_Logos/ipl-logo-new-old.png';

function Header() {
    return (
        <div className="header">
            <div className="header-content">
                <div className="logo">
                    <img src={img1} alt="Logo" className="hlogo"/>
                </div>
                <div className="links">
                    <a href="#">Match</a>
                    <a href="#">Videos</a>
                    <a href="#">Stats</a>
                    <a href="#">Point Table</a>
                    <a href="#">Teams</a>
                    <a href="#">News</a>
                    <div className="dropdown">
                        <a href="#">More</a>
                        <div className="dropdown-content">
                            <a href="#">About</a>
                            <a href="#">Photos</a>
                            <a href="#">Venues</a>
                            <a href="#">Products</a>
                            <a href="#">Fantasy</a>
                        </div>
                    </div>
                </div>
                <div className="search-bar">
                    <input type="text" placeholder="Search..." />
                    <button>Search</button>
                </div>
            </div>
        </div>
    );
}

export { Header };
