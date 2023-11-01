import ballerina/io;

public function main() returns error? {
    // Create a new HTTP client.
    HttpClient httpClient = check new ();

    // Fetch all lecturers.
    var lecturers = check httpClient->/lecturers;
    // Iterate over the lecturers and print them to the console.
    foreach var lecturer in lecturers {
        io:println(lecturer);
    }

    // Create new lecturer records.
    var lecturer1 = Lecturer    {
    fullName: "Peter",
    officeNumber: "A1",
    staffNumber: "1",
    listOfCourses: ["DSA101", "PRG101"]
};
    var lecturer2 = Lecturer    {
    fullName: "John",
    officeNumber: "A1",
    staffNumber: "2",
    listOfCourses: ["DSA101", "DTA101"]
};
    var lecturer3 = Lecturer    {
    fullName: "Jane",
    officeNumber: "A2",
    staffNumber: "3",
    listOfCourses: ["DSA101", "DPG101"]
};
    var lecturer4 = Lecturer    {
    fullName: "Thomas",
    officeNumber: "A2",
    staffNumber: "4",
    listOfCourses: ["DSA101", "DPG101"]
};
    var lecturer5 = Lecturer    {
    fullName: "Fred",
    officeNumber: "A2",
    staffNumber: "5",
    listOfCourses: ["DSA101", "DPG101"]
};
    // Post the new lecturer records to the server.
    _ = check httpClient->/newlecturer.post(lecturer1);
    _ = check httpClient->/newlecturer.post(lecturer2);
    _ = check httpClient->/newlecturer.post(lecturer3);
    _ = check httpClient->/newlecturer.post(lecturer4);
    _ = check httpClient->/newlecturer.post(lecturer5);

    // Get a lecturer by their staff number.
    var lecturerByStaffNumber = check httpClient->/lecturerbystaffnumber/["1"];
    // Print the lecturer to the console.
    io:println(lecturerByStaffNumber.toString());

    // Get lecturers by their office number.
    var lecturersByOfficeNumber = check httpClient->/lecturersbyofficenumber/["A1"];
    // Print the lecturers to the console.
    io:println(lecturersByOfficeNumber.toString());

    // Get lecturers by course code.
    var lecturersByCourseCode = check httpClient->/lecturersbycoursecode/["DSA101"];
    // Print the lecturers to the console.
    io:println(lecturersByCourseCode.toString());

    // Update a lecturer's details.
    var updatedLecturer = Lecturer    {
    fullName: "R Nashandi",
    officeNumber: "A1",
    staffNumber: "1",
    listOfCourses: ["DSA101", "PRG101"]
};
    // Put the updated lecturer details to the server.
    _ = check httpClient->/updatelecturerdetails.put(updatedLecturer);

    // Delete a lecturer.
    var deletedLecturer = check httpClient->/deletelecturer/["1"].delete;
    // Print the deleted lecturer to the console.
    io:println(deletedLecturer.toString());

    // Fetch all lecturers again.
    lecturers = check httpClient->/lecturers;
    // Iterate over the lecturers and print them to the console.
    foreach var lecturer in lecturers {
        io:println(lecturer);
    }
}
