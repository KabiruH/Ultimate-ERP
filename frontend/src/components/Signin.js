import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const SignIn = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
  
    try {
      const response = await fetch("http://127.0.0.1:3000/api/v1/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });
  
      if (response.ok) {
        // Handle successful login
        // Redirect to ProfitandLoss.js
        
        window.location.href = "path/to/ProfitandLoss.js";
        toast.success("Logged in successfully!");
      } else {
        const errorData = await response.json();
        toast.error(errorData.message || "Login failed!");
      }
    } catch (error) {
      console.error("Error during login:", error);
      toast.error("An error occurred!");
    }
  };
  

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-300 py-11 px-2 sm:px-2 lg:px-8">
      <div className="max-w-md w-full rounded-lg shadow-md bg-white overflow-hidden">
        <div className="p-2 bg border-b border-gray-200 rounded-t-lg">
          <h2 className="text-3xl font-bold leading-7 text-center mb-6">Sign In</h2>
        </div>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div className="flex flex-col">
          <label htmlFor="email" className="text-sm font-medium">Email</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="border rounded-md p-2 focus:outline-black focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <div className="flex flex-col">
          <label htmlFor="password" className="text-sm font-medium">Password</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="border rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <button
          type="submit"
          className="inline-flex items-center px-4 py-2 bg-blue-500 text-white font-bold rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700"
        >
          Sign In
        </button>
      </form>
      </div>
      <ToastContainer />
    </div>
  );
};

export default SignIn;
