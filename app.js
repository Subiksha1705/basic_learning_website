import React, { useState } from "react";
import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";

const courses = [
  {
    title: "Docker",
    videoId: "3c-iBn73dDE",
    thumbnail: "https://i.ytimg.com/vi/3c-iBn73dDE/hqdefault.jpg",
    description: "Learn the basics of Docker, containers, and how to deploy applications."
  },
  {
    title: "Git",
    videoId: "SWYqp7iY_Tc",
    thumbnail: "https://i.ytimg.com/vi/SWYqp7iY_Tc/hqdefault.jpg",
    description: "Master Git and GitHub, version control, and best practices."
  },
  {
    title: "Jenkins",
    videoId: "fxG5sRfXDcM",
    thumbnail: "https://i.ytimg.com/vi/fxG5sRfXDcM/hqdefault.jpg",
    description: "Automate your CI/CD pipeline with Jenkins."
  },
  {
    title: "Minikube",
    videoId: "odB8R3GX3c0",
    thumbnail: "https://i.ytimg.com/vi/odB8R3GX3c0/hqdefault.jpg",
    description: "A beginner's guide to Kubernetes using Minikube."
  },
  {
    title: "Shell Scripting",
    videoId: "zY3GEn39bUg",
    thumbnail: "https://i.ytimg.com/vi/zY3GEn39bUg/hqdefault.jpg",
    description: "Learn how to automate tasks using Shell Scripting."
  },
];

export default function LearningPlatform() {
  const [currentCourse, setCurrentCourse] = useState(0);
  const progress = (currentCourse / (courses.length - 1)) * 100;

  return (
    <div className="min-h-screen flex flex-col items-center p-6 bg-gray-50 text-gray-900">
      <div className="flex w-full max-w-6xl mt-6">
        {/* Sidebar */}
        <aside className="w-1/4 bg-white shadow-md rounded-xl p-4">
          <h3 className="text-lg font-semibold mb-4">Courses</h3>
          <ul>
            {courses.map((course, index) => (
              <li
                key={index}
                className={`p-2 cursor-pointer rounded-lg ${
                  currentCourse === index ? "bg-blue-200" : "hover:bg-gray-100"
                }`}
                onClick={() => setCurrentCourse(index)}
              >
                {course.title}
              </li>
            ))}
          </ul>
        </aside>
        {/* Main Content */}
        <div className="w-3/4 bg-white p-6 shadow-xl rounded-2xl ml-6">
          <h2 className="text-3xl font-semibold mb-4 text-center">{courses[currentCourse].title}</h2>
          <p className="text-gray-700 text-sm mb-4">{courses[currentCourse].description}</p>
          <div className="relative w-full pb-[56.25%] overflow-hidden rounded-lg shadow-md">
            <iframe
              className="absolute top-0 left-0 w-full h-full"
              src={`https://www.youtube.com/embed/${courses[currentCourse].videoId}`}
              title={courses[currentCourse].title}
              allowFullScreen
            ></iframe>
          </div>
          <div className="mt-6 text-center">
            <Progress className="w-full" value={progress} />
            <p className="mt-2 text-sm font-medium">{Math.round(progress)}% Completed</p>
          </div>
          <div className="flex justify-between mt-6">
            <Button
              onClick={() => setCurrentCourse((prev) => Math.max(prev - 1, 0))}
              disabled={currentCourse === 0}
              className="px-5 py-2 bg-blue-600 text-white rounded-lg shadow-md hover:bg-blue-500 disabled:bg-gray-300"
            >
              Previous
            </Button>
            <Button
              onClick={() => setCurrentCourse((prev) => Math.min(prev + 1, courses.length - 1))}
              disabled={currentCourse === courses.length - 1}
              className="px-5 py-2 bg-blue-600 text-white rounded-lg shadow-md hover:bg-blue-500 disabled:bg-gray-300"
            >
              Next
            </Button>
          </div>
        </div>
      </div>
      <footer className="w-full bg-gray-900 text-white py-4 text-center mt-10 text-sm">
        © 2025 Learning Platform. All Rights Reserved.
      </footer>
    </div>
  );
}
