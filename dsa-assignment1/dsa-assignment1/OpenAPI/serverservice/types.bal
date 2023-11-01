import ballerina/http;

public type NoContentResponse record {|
    *http:NoContent;
    InlineResponse200 body;
|};

public type BadRequestErrorResponse record {|
    *http:BadRequest;
    Error body;
|};

public type InternalServerErrorResponse record {|
    *http:InternalServerError;
    Error body;
|};

public type NotFoundErrorResponse record {|
    *http:NotFound;
    Error body;
|};

public type Office record {
    readonly string officeNumber; // the office number that identifies the office
    string[] listOfStaffNumbers; // A list of staff numbers of all the lecturers that are accomodated by the office
};

public type Error record {
    string type; // "BadRequest"|"OperationSuccessful"|"NotFound"|"InternalError"
    string message;
};

public type Lecturer record {
    readonly string staffNumber; // uniquely identifies a lecturer
    string fullName; // first and last names of the student
    string? officeNumber; // the number of the office they are located
    string[] listOfCourses; // A list of course codes that the lecturer teaches
};

public type Course record {
    readonly string courseCode; // Course code of the course
    string? courseName; // Name of the course
    int? nqfLevel; // NQF level of the course
};

public type RegistrationResponse record {
    string? userId; // the staff_number of the registered lecturer
};

public type ListLecturerResponse Lecturer|Course;
