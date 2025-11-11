*** Settings ***



*** Variables ***
#scalar
${name}    John
#List
@{fruits}    Apple    Banana    Cherry
#Dictionary
&{person}    name=Alice    age=30


*** Test Cases ***
Example Test
    ${LOCAL_VAR}=    Set Variable    I am local
    Log    ${name}
    Log    ${LOCAL_VAR}


Check Age
    ${age}=    Set Variable    20
    IF    ${age} >= 18
        Log    Adult
    ELSE IF    ${age} >= 13
        Log    Teen
    ELSE
        Log    Child
    END

Validation Example
    ${value}=    Set Variable    10
    Should Be Equal As Numbers    ${value}    11
    Should Not Be Equal    ${value}    5

Loop Example
    @{items}=    Create List    one    two    three
    FOR    ${item}    IN    @{items}
        Log    ${item}
    END

    FOR    ${index}   IN   range(5)
        Log    ${index}
    END


Reverse String

    ${text}=    Set Variable    hello
    ${rev}=    Evaluate    '${text}'[::-1]
    Log    ${rev}


*** Test Cases ***
Find Max Without Max Function
    @{nums}=    Create List    4    9    2    7
    ${max}=    Set Variable    ${nums[0]}    # Assume the first number is max initially
    FOR    ${num}    IN    @{nums}
#        Run Keyword If    ${num} > ${max}    Set Variable    ${max}    ${num}
#        if num > max
#            max = num
        IF    ${num} > ${max}
        	${max}=    Set Variable    ${num}
        END
    END
    Log    Maximum number is: ${max}


Test User Login With Valid email
#	----- given ----
    Open login page
# when
    Enter Valid email
    Click on continue
#   Then
    Validate user redirection to password screen


Practice Keywords
	${rev_out}  Reverse Str with Return
	Log    ${rev_out}
    Reverse Str with Arg   Biswajit
    Reverse Str with Multiple Arg   India   Bengalure
    ${rev_2}     Reverse Str with Multiple Arg and Return    Bengalure    India
    Log    ${rev_2}

*** Keywords ***
#keyword without argument and without return type
Validation Example
    ${value}=    Set Variable    10
    Should Be Equal As Numbers    ${value}    10
    Should Not Be Equal    ${value}    5


Reverse Str with Return
    ${text}=    Set Variable    hello
    ${rev}=    Evaluate    '${text}'[::-1]
    Log    ${rev}
    [Return]    ${rev}

Reverse Str with Arg
	[Arguments]    ${text}
#    ${text}=    Set Variable    hello
    ${rev}=    Evaluate    '${text}'[::-1]
    Log    ${rev}

Reverse Str with Multiple Arg
	[Arguments]    ${text}     ${arg2}
#    ${text}=    Set Variable    hello
    ${rev}=    Evaluate    '${text}'[::-1]
    Log    ${rev}
    Log    ${arg2}

Reverse Str with Multiple Arg and Return
	[Arguments]    ${text}     ${arg2}
#    ${text}=    Set Variable    hello
    ${rev}=    Evaluate    '${text}'[::-1]
    Log    ${rev}
    Log    ${arg2}
    [Return]    ${rev}


#C= create // Post
#R= Read   // Get
#U= Update  // Patch, Put
#D= Delete // delete
