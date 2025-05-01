#tag Class
Protected Class StatsSourceData
Implements iOSMobileTableDataSource,iOSMobileTableDataSourceEditing
	#tag Method, Flags = &h0
		Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  reloadData
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadData()
		  CurrentTrip = app.expensesDatabase.GetCurrentTrip
		  trips = app.expensesDatabase.getTrips
		  places = app.expensesDatabase.GetPlaces
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  Select case section
		  case 0
		    Return if(CurrentTrip <> nil, 1, 0)
		  case 1
		    Return trips.Count
		  case 2
		    Return places.Count
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  var cell as mobileTableCellData
		  
		  var cachedLeissurePicture as Picture = Picture.SystemImage("sun.max", 20, picture.systemimageweights.regular, BlackAndWhite)
		  var cachedWorkPicture as Picture = Picture.SystemImage("keyboard", 20, picture.systemimageweights.regular, BlackAndWhite)
		  
		  var pinPicture as Picture = Picture.SystemImage("mappin.and.ellipse", 20, picture.systemimageweights.regular, BlackAndWhite)
		  var currentPicture as Picture = Picture.SystemImage("figure.walk", 20, picture.systemimageweights.regular, BlackAndWhite)
		  Select case section
		  case 0
		    
		    cell = table.CreateCustomCell ( GetTypeInfo(BasicStatsCell) )
		    cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		    var cellControl as BasicStatsCell = BasicStatsCell( cell.Control )
		    
		    cell.Image = currentPicture
		    
		    cellControl.tag = CurrentTrip.Left
		    cellControl.TripLabel.Text = CurrentTrip.Right
		    Return cell
		    
		  case 1
		    
		    cell = table.CreateCustomCell ( GetTypeInfo(StatCell) )
		    cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		    var trip as Dictionary = trips(row)
		    var cellControl as StatCell = StatCell( cell.Control )
		    cellControl.tag = trip.Lookup(ExpensesDB.kID, nil)
		    
		    var currentDate as Double = DateTime.Now.SecondsFrom1970
		    var d1 as Double = trip.Lookup(expensesdb.kStartDate, currentdate)
		    var d2 as Double = trip.Lookup(expensesdb.kEndDate, currentDate)
		    var startDate as DateTime = new DateTime( d1 )
		    var endDate as DateTime = new DateTime( d2 )
		    
		    if startDate.SecondsFrom1970 <> currentDate then
		      var date as String = startDate.SQLDate + if(endDate.year <> 1970, " - " + endDate.SQLDate, " … ")
		      cellControl.DateLabel.Text = date
		    else
		      cellControl.DateLabel.Text = "… - …"
		    end if
		    
		    cellControl.PlaceName.Text = trip.Lookup(expensesdb.kName, "")
		    
		    var tripType as integer = trip.Lookup(ExpensesDB.kTripType, -1).IntegerValue
		    
		    Select case tripType
		    case 0
		      cell.Image = cachedLeissurePicture
		      'cellcontrol.TypeIcon.icon = cachedLeissurePicture
		    case 1
		      cell.Image = cachedWorkPicture
		      'cellcontrol.TypeIcon.icon = cachedWorkPicture
		    End Select
		    
		    cellControl.Description.Text = trip.Lookup(expensesdb.kDescription, "")
		    
		    Return cell
		    
		  case 2 
		    
		    cell = table.CreateCustomCell ( GetTypeInfo(BasicStatsCell) )
		    cell.AccessoryType = MobileTableCellData.AccessoryTypes.Disclosure
		    cell.Image = pinPicture
		    
		    var cellControl as BasicStatsCell = BasicStatsCell( cell.Control )
		    cellControl.tag = places(row).Left
		    cellControl.TripLabel.Text = places(row).Right
		    Return cell
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowEditingCompleted(table As iOSMobileTable, section As Integer, row As Integer, action As iOSMobileTable.RowEditingStyles)
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return 3
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Select case section
		  case 0
		    Return "Current Trip"
		  case 1
		    Return "Trips"
		  case 2
		    Return "Places"
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentTrip As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		Places() As pair
	#tag EndProperty

	#tag Property, Flags = &h0
		Trips() As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
