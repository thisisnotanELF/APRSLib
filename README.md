README for APRS Library
APRS Library

A C library for constructing APRS (Automatic Packet Reporting System) frames from various telemetry and messaging inputs. This library integrates AX.25 framing and offers a comprehensive API to manage APRS data, including telemetry, position, and message frames.
Description

This library provides functions to construct APRS frames, a digital communication protocol widely used in amateur radio. The library supports operations such as:

    Telemetry Data Frame Construction
    Telemetry Parameter Frame Construction
    Telemetry Unit Frame Construction
    Position Reporting Frame Construction
    Message Frame Construction
    Integration with AX.25 framing and HDLC encoding

Additionally, the library includes sample programs to demonstrate usage and integration with the ax25Lib.
Installation

To compile the library and sample programs, use the provided Makefile:

make

Ensure the ax25Lib is compiled and accessible, as it is required for APRS frame construction.
API Documentation
Telemetry Functions
telemetryInfoFrame* initTFrame();

    Description: Initializes a telemetryInfoFrame structure for constructing telemetry data frames.
    Parameters: None.
    Returns: A pointer to a dynamically allocated telemetryInfoFrame structure.

void updateTelemData(telemetryInfoFrame *frame, uint8_t *analog1, uint8_t *analog2, uint8_t *analog3, uint8_t *analog4, uint8_t *analog5, uint8_t *digital, char *comment);

    Description: Updates telemetry data in the provided frame.
    Parameters:
        frame: Pointer to the telemetry frame.
        analog1 to analog5: Analog telemetry values (as strings).
        digital: Digital telemetry values (as a binary string).
        comment: Additional information or comment.
    Returns: None.

void concatTelemData(telemetryInfoFrame *frame);

    Description: Concatenates all telemetry data into a single frame buffer.
    Parameters:
        frame: Pointer to the telemetry frame.
    Returns: None.

Parameter Functions
telemetryParamFrame* initParamFrame();

    Description: Initializes a telemetryParamFrame structure for constructing telemetry parameter frames.
    Parameters: None.
    Returns: A pointer to a dynamically allocated telemetryParamFrame structure.

void updateTelemParamData(telemetryParamFrame *frame, ...);

    Description: Updates telemetry parameter names in the provided frame.
    Parameters: A list of parameter names for analog and digital channels.
    Returns: None.

void concatParamData(telemetryParamFrame *frame);

    Description: Concatenates all parameter data into a single frame buffer.
    Parameters:
        frame: Pointer to the parameter frame.
    Returns: None.

Unit Functions
telemetryUnitFrame* initUnitFrame();

    Description: Initializes a telemetryUnitFrame structure for constructing telemetry unit frames.
    Parameters: None.
    Returns: A pointer to a dynamically allocated telemetryUnitFrame structure.

void updateTelemUnitData(telemetryUnitFrame *frame, ...);

    Description: Updates unit names for telemetry parameters in the provided frame.
    Parameters: A list of unit names for analog and digital channels.
    Returns: None.

void concatUnitData(telemetryUnitFrame *frame);

    Description: Concatenates all unit data into a single frame buffer.
    Parameters:
        frame: Pointer to the unit frame.
    Returns: None.

Position Reporting
positionFrame* initPFrame();

    Description: Initializes a positionFrame structure for constructing position reports.
    Parameters: None.
    Returns: A pointer to a dynamically allocated positionFrame structure.

void updatePositionData(positionFrame *frame, char *time, char *latitude, char *longitude, char *comment);

    Description: Updates position data in the provided frame.
    Parameters:
        time: Time of the position report.
        latitude: Latitude of the position.
        longitude: Longitude of the position.
        comment: Additional information or comment.
    Returns: None.

void concatPositionData(positionFrame *frame);

    Description: Concatenates all position data into a single frame buffer.
    Parameters:
        frame: Pointer to the position frame.
    Returns: None.

Messaging
messageFrame* initMFrame();

    Description: Initializes a messageFrame structure for constructing APRS message frames.
    Parameters: None.
    Returns: A pointer to a dynamically allocated messageFrame structure.

void updateMessageData(messageFrame *frame, char *recipient, char *message);

    Description: Updates message data in the provided frame.
    Parameters:
        recipient: Recipient call sign.
        message: The message content.
    Returns: None.

void concatMessageData(messageFrame *frame);

    Description: Concatenates all message data into a single frame buffer.
    Parameters:
        frame: Pointer to the message frame.
    Returns: None.

Memory Management

The user is responsible for freeing all dynamically allocated memory using free() after the frames are no longer needed. Failure to do so will result in memory leaks.
Notes

    This library depends on ax25Lib for HDLC framing and AX.25 encoding.
    Verbose functions are available for debugging and provide detailed intermediate outputs.

Steps to Clone and Build

    Clone the repository:

git clone https://github.com/thisisnotanELF/APRSLib.git
cd APRSLib

Build the library and samples:

make

Run the samples to test functionality.
