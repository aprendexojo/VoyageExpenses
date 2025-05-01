#tag MobileScreen
Begin MobileScreen HomeScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   HasNavigationBar=   False
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   ScaleFactor     =   0.0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c63B77F00
   Title           =   ""
   Top             =   0
   Begin TripContainer TripContainer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TripContainer1, 8, , 0, False, +1.00, 4, 1, 291, , True
      AutoLayout      =   TripContainer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TripContainer1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TripContainer1, 3, <Parent>, 3, False, +1.00, 4, 1, -30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   291
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   -30
      Visible         =   True
      Width           =   375
   End
   Begin MobileLocation Location1
      Accuracy        =   0
      AllowBackgroundUpdates=   False
      AuthorizationState=   0
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   0
      VisitAwareness  =   False
   End
   Begin RecentExpensesHeader RecentExpensesHeader1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   RecentExpensesHeader1, 1, TripContainer1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   RecentExpensesHeader1, 2, TripContainer1, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   RecentExpensesHeader1, 3, TripContainer1, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   RecentExpensesHeader1, 8, , 0, False, +1.00, 4, 1, 32, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   32
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   261
      Visible         =   True
      Width           =   375
      Begin MobileLabel RecentExoensesLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   1
         AutoLayout      =   RecentExoensesLabel, 1, RecentExpensesHeader1, 1, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   RecentExoensesLabel, 2, RecentExpensesHeader1, 2, False, +1.00, 4, 1, 0, , True
         AutoLayout      =   RecentExoensesLabel, 8, , 0, False, +1.00, 4, 1, 31, , True
         AutoLayout      =   RecentExoensesLabel, 10, RecentExpensesHeader1, 10, False, +1.00, 4, 1, -1, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   31
         Left            =   0
         LineBreakMode   =   0
         LockedInPosition=   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "RecentExpensesHeader1"
         Scope           =   2
         SelectedText    =   ""
         SelectionLength =   0
         SelectionStart  =   0
         Text            =   "Trip Expenses"
         TextColor       =   &c000000
         TextFont        =   ""
         TextSize        =   20
         TintColor       =   &c000000
         Top             =   260
         Visible         =   True
         Width           =   375
         _ClosingFired   =   False
      End
   End
   Begin ExpensesTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   Table1, 4, TotalPaidContainer1, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table1, 3, RecentExpensesHeader1, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   421
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   293
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin TotalPaidContainer TotalPaidContainer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TotalPaidContainer1, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -40, , True
      AutoLayout      =   TotalPaidContainer1, 8, , 0, False, +1.00, 4, 1, 58, , True
      AutoLayout      =   TotalPaidContainer1, 1, Table1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TotalPaidContainer1, 2, Table1, 2, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   58
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   714
      Visible         =   True
      Width           =   375
      Begin MobileLabel TotalLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         Alignment       =   2
         AutoLayout      =   TotalLabel, 8, , 0, False, +1.00, 4, 1, 40, , True
         AutoLayout      =   TotalLabel, 1, TotalPaidContainer1, 1, False, +1.00, 4, 1, 182, , True
         AutoLayout      =   TotalLabel, 2, TotalPaidContainer1, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
         AutoLayout      =   TotalLabel, 10, TotalPaidContainer1, 10, False, +1.00, 4, 1, 0, , True
         ControlCount    =   0
         Enabled         =   True
         Height          =   40
         Left            =   182
         LineBreakMode   =   0
         LockedInPosition=   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "TotalPaidContainer1"
         Scope           =   0
         SelectedText    =   ""
         SelectionLength =   0
         SelectionStart  =   0
         Text            =   "0"
         TextColor       =   &c000000
         TextFont        =   ""
         TextSize        =   20
         TintColor       =   &c000000
         Top             =   723
         Visible         =   True
         Width           =   173
         _ClosingFired   =   False
      End
   End
   Begin MobileMessageBox CloseTripConfirmation
      Left            =   0
      LeftButton      =   "Cancel"
      LockedInPosition=   False
      Message         =   ""
      PanelIndex      =   -1
      Parent          =   ""
      RightButton     =   ""
      Scope           =   2
      Title           =   ""
      Top             =   0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  TripValue = app.expensesDatabase.getCurrentTrip
		  TripContainer1.Update(TripValue)
		  
		  if TripValue <> nil then
		    Table1.ReloadDataForTrip( TripValue.Left)
		    TotalLabel.Text = table1.GetGrandTotal.ToString(locale.Current)
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  me.TabIcon = Picture.SystemImage("Home", 24)
		  var bar as iOSTabBar = me.ParentTabBar
		  bar.IconAt(0) = Picture.SystemImage("house", 24)
		  bar.IconAt(1) = Picture.SystemImage("globe.europe.africa", 24)
		  bar.IconAt(2) = Picture.SystemImage("tag", 24)
		  bar.IconAt(3) = Picture.SystemImage("chart.pie", 24)
		  bar.IconAt(4) = Picture.SystemImage("ellipsis", 24)
		  
		  If location1.AuthorizationState = MobileLocation.AuthorizationStates.AuthorizedAppInUse Then
		    // we've got our requested authorization state, start getting LocationChanged events
		    location1.Start
		  Else
		    // we don't have authorization yet, so ask for it
		    location1.RequestUsageAuthorization(MobileLocation.UsageTypes.AppInUse)
		    location1.Start
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub OrientationChanged()
		  Select case System.Device.Orientation
		    
		  case System.DeviceData.Orientations.LandscapeLeft, System.DeviceData.Orientations.LandscapeRight
		    RecentExpensesHeader1.Visible = False
		    RecentExoensesLabel.Visible = False
		  Else
		    RecentExpensesHeader1.Visible = True
		    RecentExoensesLabel.Visible = True
		  End Select
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		CurrentLocation As Pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TripValue As pair
	#tag EndProperty


#tag EndWindowCode

#tag Events TripContainer1
	#tag Event
		Sub AddTrip()
		  var sc as new NewTripScreen
		  sc.Show(self)
		End Sub
	#tag EndEvent
	#tag Event
		Sub NewExpense(tripID As Integer)
		  var sc as new NewExpenseScreen( tripID, currentLocation )
		  sc.Show(self)
		End Sub
	#tag EndEvent
	#tag Event
		Sub CloseTrip(tripID As Integer)
		  CloseTripConfirmation.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Location1
	#tag Event
		Sub LocationChanged(latitude As Double, longitude As Double, accuracy As Double, altitude As Double, altitudeAccuracy As Double, course As Double, speed As Double)
		  CurrentLocation = new pair(latitude, longitude)
		  
		  if TripContainer1.Currentlatitude <> latitude then
		    TripContainer1.UpdateWithLatitude( latitude )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RecentExoensesLabel
	#tag Event
		Sub Opening()
		  me.TextColor = BlackAndWhite
		  me.TextFont = new font("AvenirNextCondensed-DemiBold", 20)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Table1
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  var expense as Dictionary = me.getExpenseForRow(row)
		  
		  if expense <> nil then
		    
		    var sc as new ExpenseDetailScreen(expense)
		    sc.Show(self)
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ApplyLeadingActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var Actions(0) As iOSMobileTableRowAction
		  Const kFlagTag As String = "Duplicate"
		  
		  // Create the Delete button
		  Actions(0) = New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Normal, "Duplicate", kFlagTag)
		  
		  Return Actions
		End Function
	#tag EndEvent
	#tag Event
		Sub RowActionSelected(section As Integer, row As Integer, actionTag As Variant)
		  var expense as Dictionary = me.getExpenseForRow(row)
		  
		  if expense <> nil and TripValue <> nil then
		    
		    Select case actionTag
		      
		    case "Delete"
		      
		      app.expensesDatabase.DeleteExpense( expense )
		      
		    case "Duplicate"
		      
		      expense.Value(ExpensesDB.kDate) = DateTime.Now.SecondsFrom1970
		      
		      if CurrentLocation <> nil then
		        expense.Value(expensesdb.kLocation) = CurrentLocation.Left.StringValue + "#" + CurrentLocation.Right.StringValue
		      end if
		      
		      app.expensesDatabase.AddExpense( TripValue.Left, expense )
		      
		    End Select
		    
		    me.ReloadDataForTrip( TripValue.Left )
		    TotalLabel.Text = me.getGrandTotal.ToString(Locale.Current)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function ApplyActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var Actions(0) As iOSMobileTableRowAction
		  Const kFlagTag As String = "Delete"
		  
		  // Create the Delete button
		  Actions(0) = New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Destructive, "Delete", kFlagTag)
		  
		  Return Actions
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TotalLabel
	#tag Event
		Sub Opening()
		  me.TextFont = new font("AvenirNextCondensed-DemiBold", 20)
		  'me.TextColor = color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseTripConfirmation
	#tag Event
		Sub Opening()
		  Var buttons() As String = Array("Cancel", "Close Trip")
		  me.Title = "Close Current Trip"
		  me.Message = "Do you want to close the current Trip?"
		  me.Buttons = buttons
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(buttonIndex As Integer)
		  if buttonIndex = 1 then
		    app.expensesDatabase.CloseTrip( TripValue.Left )
		    TripValue = app.expensesDatabase.getCurrentTrip
		    TripContainer1.Update(TripValue)
		    Table1.RemoveData
		    Table1.ReloadDataSource
		    TotalLabel.Text = "0"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScaleFactor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
