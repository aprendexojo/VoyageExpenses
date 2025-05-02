#tag MobileScreen
Begin MobileScreen statsDetailScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   ScaleFactor     =   0.0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   ""
   Top             =   0
   Begin MobileChart StatsDetail
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      AutoLayout      =   StatsDetail, 8, , 0, False, +1.00, 4, 1, 267, , True
      AutoLayout      =   StatsDetail, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   StatsDetail, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatsDetail, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      Backdrop        =   0
      BackgroundColor =   &c000000
      ControlCount    =   0
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      Format          =   ""
      GridColor       =   &c000000
      HasLegend       =   True
      Height          =   267
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   20
      LegendColor     =   &c000000
      LegendFontSize  =   0.0
      LockedInPosition=   False
      Mode            =   3
      PopoverBackgroundColor=   &c000000
      PopoverTextColor=   &c000000
      Scope           =   0
      TextColor       =   &c000000
      TintColor       =   &c000000
      Title           =   ""
      TitleColor      =   &c000000
      TitleFontSize   =   0.0
      Top             =   73
      Visible         =   True
      Width           =   355
      _ClosingFired   =   False
      _mCircularLegendsRedraw=   False
      _mIsXAxisVisible=   True
      _mIsYAxisVisible=   True
      _mLegendsHeight =   12
   End
   Begin MobileChart StatsBudget
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      AutoLayout      =   StatsBudget, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 20, , True
      AutoLayout      =   StatsBudget, 8, , 0, False, +1.00, 4, 1, 261, , True
      AutoLayout      =   StatsBudget, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatsBudget, 2, StatsDetail, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatsBudget, 3, TotalExpensesLabel, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      Backdrop        =   0
      BackgroundColor =   &c000000
      ControlCount    =   0
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      Format          =   ""
      GridColor       =   &c000000
      HasLegend       =   True
      Height          =   261
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   0
      LegendColor     =   &c000000
      LegendFontSize  =   0.0
      LockedInPosition=   False
      Mode            =   1
      PopoverBackgroundColor=   &c000000
      PopoverTextColor=   &c000000
      Scope           =   0
      TextColor       =   &c000000
      TintColor       =   &c000000
      Title           =   "#kBudgetVsCurrentExpenses"
      TitleColor      =   &c000000
      TitleFontSize   =   0.0
      Top             =   358
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
      _mCircularLegendsRedraw=   False
      _mIsXAxisVisible=   True
      _mIsYAxisVisible=   True
      _mLegendsHeight =   12
   End
   Begin MobileLabel TotalExpensesLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   1
      AutoLayout      =   TotalExpensesLabel, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   TotalExpensesLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   TotalExpensesLabel, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   TotalExpensesLabel, 3, StatsDetail, 4, False, +1.00, 4, 1, -20, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   320
      Visible         =   True
      Width           =   335
      _ClosingFired   =   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  CheckOrientation
		  
		  redim expenses(-1)
		  
		  if tripID <> -1 then
		    Expenses = app.expensesDatabase.GetExpensesForTrip( tripID )
		    
		  elseif PlaceName <> "" then
		    expenses = app.expensesDatabase.getExpensesForPlace( PlaceName )
		    
		  end if
		  
		  GetExpenses
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivated()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  var bt as new MobileToolbarButton(MobileToolbarButton.Types.Custom,"", Picture.SystemImage("map", 16))
		  bt.Tag = kLocation
		  me.RightNavigationToolbar.AddButton bt
		  
		  bt = new MobileToolbarButton(MobileToolbarButton.Types.Custom, "", Picture.SystemImage("paintpalette", 16))
		  bt.Tag = kColors
		  me.RightNavigationToolbar.AddButton bt
		End Sub
	#tag EndEvent

	#tag Event
		Sub OrientationChanged()
		  CheckOrientation
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  if button.tag = kLocation then
		    
		    var locations() as MapLocation
		    var latitude, longitude as Double
		    var s as String
		    var ml as MapLocation
		    var found as Boolean
		    
		    for each item as Dictionary in expenses
		      s = item.Value( ExpensesDB.kLocation)
		      found = false
		      if s <> "" then
		        try
		          latitude = s.NthField("#",1).ToDouble
		          longitude =  s.NthField("#", 2).ToDouble
		          
		          ml = new MapLocation( latitude, longitude)
		          
		          for n as integer = 0 to Locations.LastIndex
		            if locations(n).Latitude = latitude and locations(n).Longitude = longitude then
		              found = true
		              exit
		            end if
		          next 
		          
		          if not found then locations.add ml
		          
		        catch e as UnsupportedOperationException
		        catch i as InvalidArgumentException
		          
		        end try
		      end if
		      
		    next
		    
		    if Locations.Count <> 0 then
		      var sc as new LocationMapScreen
		      sc.TripLocation.AddLocation locations
		      sc.ShowModal(me)
		    end if
		    
		  elseif button.Tag = kColors then
		    var sc as new TagsColorsScreen
		    AddHandler sc.Closing, AddressOf me.handleClose
		    sc.ShowModal(me)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckOrientation()
		  if System.Device.Orientation = System.DeviceData.Orientations.LandscapeLeft or system.device.orientation = system.DeviceData.orientations.LandscapeRight then
		    StatsBudget.Visible = False
		  else
		    if tripbudget > 0 then StatsBudget.Visible = true
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(id as Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.tripID = id
		  
		  tripBudget = app.expensesDatabase.getBudgetForTrip( id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(placeName as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.PlaceName = placeName
		  me.tripBudget = app.expensesDatabase.getBudgetForPlace( placeName )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetExpenses()
		  StatsDetail.RemoveAllDatasets
		  StatsDetail.RemoveAllLabels
		  
		  StatsBudget.Visible = tripBudget > 0
		  
		  var labels() as String
		  var colors() as color
		  var values as new Dictionary
		  
		  var totalExpenses as Double
		  
		  var rnd as new Random
		  
		  var amount as Double
		  var categoryName as String
		  for each  expense as Dictionary in Expenses
		    categoryName = expense.Value( expensesdb.kCategory )
		    if labels.IndexOf( categoryName ) = -1 then 
		      labels.add categoryName
		      amount = double.FromString(expense.Value(expensesdb.kAmount).StringValue, locale.Current)
		      totalExpenses = totalExpenses + amount
		      values.Value(Categoryname) = amount
		    else
		      var d as Double
		      d = values.Value(categoryName)
		      amount =  double.FromString(expense.Value(expensesdb.kAmount).StringValue, locale.Current)
		      totalExpenses = totalExpenses + amount
		      d = d + amount
		      values.Value(categoryName) = d
		    end if
		    
		    var c as String
		    if not app.cachedColors.HasKey( categoryName) then 
		      c = color.RGB(rnd.InRange(0,255), rnd.InRange(0, 255), rnd.InRange(0, 255)).ToString
		      app.cachedColors.Value( categoryName ) = c
		    end if
		    
		  next
		  
		  var dataPoints() as Double
		  
		  for each item as DictionaryEntry in values
		    dataPoints.add item.Value.DoubleValue
		  next
		  
		  for each item as String in labels
		    colors.add color.FromString( app.cachedColors.Value( item ) )
		  next
		  
		  TotalExpensesLabel.Text = kTotalExpenses +  totalExpenses.ToString(locale.Current)
		  
		  StatsDetail.AddDatasets new ChartCircularDataset("", dataPoints, colors)
		  StatsDetail.AddLabels labels
		  
		  if StatsBudget.Visible then
		    StatsBudget.RemoveAllDatasets
		    StatsBudget.AutoCalculateYAxis = false
		    StatsBudget.TitleFontSize = 20
		    var budgetds as new ChartLinearDataset( kBudget, color.Red, true, Array(tripBudget) )
		    budgetds.ChartType = ChartLinearDataset.ChartTypes.Bar
		    var total as new ChartLinearDataset( kTotal, color.Green, true, Array(totalExpenses) )
		    total.ChartType = ChartLinearDataset.ChartTypes.Bar
		    
		    StatsBudget.AddDatasets( budgetds, total )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleClose(sc as MobileScreen)
		  RemoveHandler sc.Closing, AddressOf HandleClose
		  
		  GetExpenses
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		expenses() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		PlaceName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		tripBudget As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tripID As integer = -1
	#tag EndProperty


	#tag Constant, Name = kColors, Type = String, Dynamic = False, Default = \"Colors", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocation, Type = String, Dynamic = False, Default = \"Location", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events StatsDetail
	#tag Event
		Sub Opening()
		  me.BackgroundColor = color.Clear
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatsBudget
	#tag Event
		Sub Opening()
		  me.IsGridVisible = False
		  me.BackgroundColor = color.Clear
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
	#tag ViewProperty
		Name="tripID"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="tripBudget"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PlaceName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
