import React from "react";
import "./foot.css";
import fb from "./facebook.png";
import twitter from "./twitter.png";
import instagram from "./instagram.png";

const Foot = () => {
    return <div className="body-div"></div>;
};

const Footer = () => {
    return (
        <div className="footer">
            <div className="sb_footer section_padding">
                <div className="sb_footer-links">
                    <div className="sb_footer-links-div">
                        <h4>Teams</h4>
                        <a href="/Chennai Super Kings">
                            <p>Chennai Super Kings</p>
                        </a>
                        <a href="/Delhi Capitals">
                            <p>Delhi Capitals</p>
                        </a>
                        <a href="/Gujarat Titans">
                            <p>Gujarat Titans</p>
                        </a>
                        <a href="/Kolkata Knight Rider">
                            <p>Kolkata Knight Rider</p>
                        </a>
                        <a href="/Lucknow Super Giants">
                            <p>Lucknow Super Giants</p>
                        </a>
                        <a href="/Mumbai Indians">
                            <p>Mumbai Indians</p>
                        </a>
                        <a href="/Punjab Kings">
                            <p>Punjab Kings</p>
                        </a>
                        <a href="/Rajasthan Royals">
                            <p>Rajasthan Royals</p>
                        </a>
                        <a href="/Royal Challengers Bengaluru">
                            <p>Royal Challengers Bengaluru</p>
                        </a>
                        <a href="/Sunrisers Hyderabad">
                            <p>Sunrisers Hyderabad</p>
                        </a>
                    </div>
                    <div className="sb_footer-links-div">
                        <h4>About</h4>
                        <a href="/About Us">
                            <p>About Us</p>
                        </a>
                        <a href="/Anti Corruption Policy">
                            <p>Anti Corruption Policy</p>
                        </a>
                        <a href="/Anti Doping Policy">
                            <p>Anti Doping Policy</p>
                        </a>
                        <a href="/Anti Discrimination Policy">
                            <p>Anti Discrimination Policy</p>
                        </a>
                        <a href="/Clothing And Equipment Regulations">
                            <p>Clothing And Equipment Regulations</p>
                        </a>
                        <a href="/Code Of Conduct For Players And Teams Officials">
                            <p>Code Of Conduct For Players And Teams Officials</p>
                        </a>
                        <a href="/Image Use Terms">
                            <p>Image Use Terms</p>
                        </a>
                    </div>
                    <div className="sb_footer-links-div">
                        <h4>Guidelines</h4>
                        <a href="/IPL Code Of Conduct For Match Officials">
                            <p>IPL Code Of Conduct For Match Officials</p>
                        </a>
                        <a href="/Governing Council">
                            <p>Governing Council</p>
                        </a>
                        <a href="/Match Playing Conditions">
                            <p>Match Playing Conditions</p>
                        </a>
                        <a href="/Suspect Action Policy">
                            <p>Suspect Action Policy</p>
                        </a>
                    </div>
                    <div className="sb_footer-links-div">
                        <h4>Contact Us</h4>
                        <p>+91 9106663034</p>
                        <p>jigarbhoye@gmail.com</p>
                        <div className="socialmedia">
                            <a href="https://www.facebook.com/IPL" target="_blank"><p><img src={fb} alt="Facebook" /></p></a>
                            <a href="https://www.twitter.com/IPL" target="_blank"><p><img src={twitter} alt="Twitter" /></p></a>
                            <a href="https://www.instagram.com/iplt20" target="_blank"><p><img src={instagram} alt="Instagram" /></p></a>
                        </div>
                    </div>
                </div>

                <div className="sb_footer-below">
                    <div className="sb_footer-copyright">
                        <p>
                            @{new Date().getFullYear()} <span>Job Portal</span> All
                            Rights Reserved.
                        </p>
                    </div>
                    <div className="sb_footer-below-links">
                        <a href="/Terms"><div><p>Terms and Condition</p></div></a>
                        <a href="/Privacy"><div><p>Privacy Policy</p></div></a>
                        <a href="/Security"><div><p>Security</p></div></a>
                    </div>
                </div>
            </div>
        </div>
    );
};

export { Foot, Footer };
