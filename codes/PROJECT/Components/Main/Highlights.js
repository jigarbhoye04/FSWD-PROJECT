import React, { useState, useEffect } from "react";
import "./Highlights.css";

function Highlights() {
    const [currentHighlightIndex, setCurrentHighlightIndex] = useState(0);
    const highlights = [
        {
            id: 1,
            description: "Exciting match between Team A and Team B",
            date: "March 30, 2024",
            duration: "10:30",
            views: 10000,
            videoUrl: "https://example.com/video1",
            imageUrl: "https://assets.bcci.tv/bcci/photos/1361/add95496-28ef-496b-92d9-fb5618f5f492.jpg",
        },
        {
            id: 2,
            description: "Amazing comeback by Team C",
            date: "March 31, 2024",
            duration: "12:15",
            views: 15000,
            videoUrl: "https://example.com/video2",
            imageUrl: "highlight2.jpg",
        },
        // Add more highlights as needed
    ];

    useEffect(() => {
        const interval = setInterval(() => {
            const randomIndex = Math.floor(Math.random() * highlights.length);
            setCurrentHighlightIndex(randomIndex);
        }, 5000);

        return () => clearInterval(interval);
    }, [highlights]);

    const handleWatchVideo = (videoUrl) => {
        window.location.href = videoUrl;
    };

    const handleShare = () => {
        alert("Share functionality not implemented yet.");
    };

    const goToPreviousHighlight = () => {
        setCurrentHighlightIndex((prevIndex) => (prevIndex === 0 ? highlights.length - 1 : prevIndex - 1));
    };

    const goToNextHighlight = () => {
        setCurrentHighlightIndex((prevIndex) => (prevIndex === highlights.length - 1 ? 0 : prevIndex + 1));
    };

    const currentHighlight = highlights[currentHighlightIndex];

    return (
        <div className="highlights-container">
            <div className="highlights-content">
                <div className="highlight-description">
                    <p>{currentHighlight.description}</p>
                    <div className="highlight-info">
                        <span>{currentHighlight.date} |</span>
                        <span> Duration: {currentHighlight.duration} |</span>
                        <span> Views: {currentHighlight.views}</span>
                    </div>
                </div>
                <div className="highlight-video">
                    <img src={currentHighlight.imageUrl} alt="Highlight" className="highlight-image" />
                    <div className="video-controls">
                        <button onClick={() => handleWatchVideo(currentHighlight.videoUrl)}>Watch Video</button>
                        <button onClick={handleShare}>Share</button>
                    </div>
                </div>
                <button className="arrow-button left-arrow" onClick={goToPreviousHighlight}>&lt;</button>
                <button className="arrow-button right-arrow" onClick={goToNextHighlight}>&gt;</button>
            </div>
        </div>
    );
}

export { Highlights };
