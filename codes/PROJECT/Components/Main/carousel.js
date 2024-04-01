import React, { useState, useEffect } from 'react';
import { Carousel } from 'react-bootstrap'; // Import Carousel from react-bootstrap
// import ExampleCarouselImage from './ExampleCarouselImage';
import './carousel.css';
import img1 from './Images/vk.png'; 
import img2 from './Images/vk2.png';

const images = [
    {
      src: img1 ,
      alt: 'Image 1',
      title: 'Image 1 Title',
      description: 'Description of Image 1',
      link: 'https://www.iplt20.com/photos/1363?royal-challengers-bangalore-vs-kolkata-knight-riders-t20-league',
    },
    {
      src: img2,
      alt: 'Image 2',
      title: 'Image 2 Title',
      description: 'Description of Image 2',
      link: 'https://www.iplt20.com/photos/1363?royal-challengers-bangalore-vs-kolkata-knight-riders-t20-league',
    },
    // Add more images as needed
  ];

const ImageCarousel = () => { // Removed the parameter from here
  const [currentIndex, setCurrentIndex] = useState(0);
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      const newIndex = (currentIndex + 1) % images.length;
      setCurrentIndex(newIndex);
      setProgress((newIndex / images.length) * 100);
    }, 5000); // Change slide every 5 seconds

    return () => clearInterval(interval);
  }, [currentIndex, images.length]);

  const goToSlide = (index) => {
    setCurrentIndex(index);
    setProgress((index / images.length) * 100);
  };

  return (
    <div className="image-carousel">
      <Carousel> {/* Wrap the content with Carousel component */}
        {images.map((image, index) => (
          <Carousel.Item key={index}>
            <img
              src={image.src}
              alt={image.alt}
              className={index === currentIndex ? 'slide active' : 'slide'}
            />
            <Carousel.Caption>
              <h2>{image.title}</h2>
              <p>{image.description}</p>
              <a href={image.link} target="_blank" rel="noopener noreferrer">Link</a>
              <p>{new Date().toLocaleTimeString()}</p>
            </Carousel.Caption>
          </Carousel.Item>
        ))}
      </Carousel>
      <div className="progress-bar" style={{ width: `${progress}%` }}></div>
    </div>
  );
};

function IndividualIntervalsExample() {
  return (
    <Carousel>
      <Carousel.Item interval={1000}>
        {/* <ExampleCarouselImage text="First slide" /> */}
        <Carousel.Caption>
          <h3>First slide label</h3>
          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
        </Carousel.Caption>
      </Carousel.Item>
      <Carousel.Item interval={500}>
        {/* <ExampleCarouselImage text="Second slide" /> */}
        <Carousel.Caption>
          <h3>Second slide label</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </Carousel.Caption>
      </Carousel.Item>
      <Carousel.Item>
        {/* <ExampleCarouselImage text="Third slide" /> */}
        <Carousel.Caption>
          <h3>Third slide label</h3>
          <p>
            Praesent commodo cursus magna, vel scelerisque nisl consectetur.
          </p>
        </Carousel.Caption>
      </Carousel.Item>
    </Carousel>
  );
}

export { ImageCarousel, IndividualIntervalsExample };
