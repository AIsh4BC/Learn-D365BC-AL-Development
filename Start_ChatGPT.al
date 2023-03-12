// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
//pageextension 50100 MyRoleCenterExtension extends "Role Center"
{
    //  trigger OnOpenPage();
    //   var
    //begin
    // Page.Run(50112);
    // end;
    layout
    {
        // The "addlast" construct adds the field control as the last control in the General 
        // group.
        //  addlast(General)
        //{
        //     field("ChatGPT"; Rec."ChatGPT")
        //    {
        //       ApplicationArea = All;

        // Lookup property is used to provide a lookup window for 
        // a text box. It is set to true, because a lookup for 
        // the field is needed.
        //Lookup = true;
        // }
        //     }
    }

    actions
    {
        // The "addfirst" construct will add the action as the first action
        // in the Navigation group.
        addlast(navigation)
        {
            action("Chat_GPT")
            {
                ApplicationArea = All;
                // "RunObject" sets the "Chat GPT" page as the object 
                // that will run when the action is activated.
                RunObject = page "Chat GPT";
            }
        }
    }
}