*** Keywords ***

Reverse Given String
	[Arguments]    ${text}
    ${rev}=    Evaluate    '${text}'[::-1]
    [Return]    ${rev}

