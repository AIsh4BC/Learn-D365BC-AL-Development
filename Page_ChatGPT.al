page 50112 "Chat GPT"
{

    ApplicationArea = All;
    // The page will be of type "List" and will render as a List.
    PageType = List;
    //Page Caption
    Caption = 'Chat GPT Integration';
    SourceTable = "Chat GPT";
    //Sorting descending
    SourceTableView = order(descending);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            field(MessageToSend; MessageToSend)
            {
                ApplicationArea = All;
                Caption = 'git s';
                trigger OnValidate()
                begin
                    APIKEY := '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';
                    //APIKEY := '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';
                    if MessageToSend <> '' then begin
                        ChatGPTIntegrationwithBC.InsertResponse('Me: ' + MessageToSend);
                        Commit();
                        CurrPage.Update(false);
                        response := ChatGPTIntegrationwithBC.SendMessage(APIKEY, MessageToSend);
                        MessageToSend := '';
                        CurrPage.Update(false);
                    end;
                end;
            }
            repeater(General)
            {
                Editable = false;
                field(Message; Rec.Message)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Message field.';
                    MultiLine = true;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ODTChatGPT)
            {
                ApplicationArea = All;
                Caption = 'Send message to ChatGPT';
                ObsoleteState = Pending;
                ObsoleteReason = 'trigger will be in text/field onvalidate';

                trigger OnAction()

                begin
                    response := ChatGPTIntegrationwithBC.SendMessage(APIKey, MessageToSend);
                    Message(response);
                end;
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     MessageToSend := 'create business central api?';
    //     ChatGPTSetup.FindFirst();
    // end;

    var
        ChatGPTIntegrationwithBC: Codeunit "ChatGPT Integration with BC";
        //ChatGPTSetup: Record "Chat GPT Setup";
        MessageToSend, response : Text;
        APIKEY: text;
}