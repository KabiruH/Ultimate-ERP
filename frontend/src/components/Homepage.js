import React from 'react';
import { Link } from 'react-router-dom';
const HomePage = () => {
    return (
        <div className="min-h-screen bg-no-repeat bg-cover bg-center" style={{ backgroundImage: `url(your-image.jpg)` }}>
          <nav className="bg-gray-800 text-white fixed top-0 z-50 w-full py-4">
            <div className="container mx-auto px-4 flex items-center justify-between">
              <a href="#" className="font-bold text-xl">Ultimate ERP</a>
              <button className="bg-transparent hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:ring">
                Sign In
              </button>
            </div>
          </nav>
          <div className="container mx-auto px-4 pt-20 pb-12">
            {/* Add your main content here */}
            <h2 className="text-3xl font-bold mb-8">Welcome to Ultimate ERP</h2>
            <p className="text-gray-700 leading-7">
              Experience the power of a comprehensive ERP solution designed to streamline your business operations.
            </p>
            <button className="mt-8 bg-transparent hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:ring">
              Learn More
            </button>
          </div>
        </div>
      );
};

export default HomePage;
