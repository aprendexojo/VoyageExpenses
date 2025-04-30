#tag Class
Protected Class ExpensesDB
Inherits SqliteDatabase
	#tag Method, Flags = &h0
		Sub AddCategory(value as String)
		  if isConnected then
		    var command as String = "Insert into categories(category) values( ? )"
		    try
		      if not me.recordExists( "categories", "category", value) then
		        me.ExecuteSQL( command, value)
		        redim cachedCategories(-1)
		      end if
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddExpense(tripID as integer, values as Dictionary)
		  if me.isConnected and values <> nil then
		    
		    var amount as String = values.Lookup(kAmount, "")
		    var name as String = values.Lookup(kName, "")
		    var categoryID as String = values.Lookup(kCategoryID, "")
		    var date as double = values.Lookup(kDate, DateTime.Now.SecondsFrom1970)
		    var description as String = values.Lookup(kDescription, "")
		    var location as String = values.Lookup(kLocation, "")
		    
		    if amount <> "" then
		      
		      var command as String = "insert into expenses(tripID, amount, name, description, date, categoryID, location) values(?,?,?,?,?,?, ?)"
		      
		      try
		        me.ExecuteSQL(command, tripid, amount, name, description, date, categoryID, location)
		      Catch e as DatabaseException
		        
		      end try
		      
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPlace(value As String)
		  if isConnected then
		    var command as String = "Insert into places(place, creationDate) values( ?, ? )"
		    var date as double = DateTime.now.SecondsFrom1970
		    try
		      if not me.recordExists( "places", "place", value) then
		        me.ExecuteSQL( command, value, date)
		      else
		        
		        // If it already exists it is because it has been marked as "Deleted"
		        // so let's change that flag for the existing place
		        
		        command = "update places set isDeleted=0 where place=?"
		        me.ExecuteSQL( command, value )
		      end if
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		  
		  redim cachedPlaces(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTrip(values As Dictionary)
		  if isConnected and values <> nil then
		    
		    var command as String = "insert into trip(placeID, description, budget, type, isOpened, startDate) values(?, ?, ?, ?, ?,?)"
		    
		    var placeID as String = values.Lookup(kPlaceID, "")
		    var description as String = values.Lookup(kDescription, "")
		    var budget as String = values.Lookup(kBudget, "")
		    var type as String = values.Lookup(kTripType, "")
		    var isOpened as string = values.Lookup(kIsOpen, "1")
		    var startDate as String = DateTime.Now.SecondsFrom1970.ToString
		    
		    if isOpened = "true" then
		      isOpened = "1"
		    else
		      isOpened = "0"
		    end if
		    
		    if placeid <> "" then
		      
		      try
		        me.ExecuteSQL(command, placeID, description, budget, type, isOpened, startDate)
		      Catch e as DatabaseException
		        
		      end try
		      
		      
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseTrip(tripID As Integer)
		  if isConnected then
		    
		    var endDate as String = DateTime.Now.SecondsFrom1970.ToString
		    var command as String = "update Trip set isOpened = 0, endDate = ? where id = ?"
		    
		    try
		      me.ExecuteSQL(command, endDate, tripID )
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Connect()
		  // Calling the overridden superclass method.
		  Super.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.databaseFile = SpecialFolder.Documents.Child("Expenses.db")
		  
		  if databaseFile <> nil and databaseFile.Exists = false then
		    
		    // The expected database file is not found in the Application Support directory
		    // so we proceed to copy the skeleton database to it
		    
		    var skeletonDatabase as FolderItem = SpecialFolder.Resource("Expenses.db")
		    if skeletonDatabase <> nil and skeletonDatabase.Exists then
		      skeletonDatabase.CopyTo( me.databaseFile )
		    end if
		  end if
		  
		  if me.databaseFile <> nil and me.databaseFile.Exists then
		    Try
		      me.Connect
		      me.isConnected = true
		    Catch error As DatabaseException
		      MessageBox("Error connecting to the database: " + error.Message)
		    End Try
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteCategory(id as String)
		  if isConnected then
		    var command as String = "delete from categories where id = ?"
		    try
		      me.ExecuteSQL( command, id)
		      redim cachedCategories(-1)
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteExpense(expense As Dictionary)
		  if isConnected and expense <> nil then
		    if expense.HasKey(kID) then
		      var command as String = "delete from expenses where id = ?"
		      
		      try
		        me.ExecuteSQL(command, expense.Value(kID))
		      catch e as DatabaseException
		        
		      end try
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeletePlaceWithID(id As Integer)
		  if isConnected then
		    
		    var command as String = "Update places set isDeleted=1 where id = ?"
		    
		    try
		      me.ExecuteSQL(command, id)
		      redim CachedPlaces(-1)
		    catch e as DatabaseException
		      Break
		    end try
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getBudgetForPlace(placeName as String) As Double
		  var AggregatedBudget as Double
		  
		  if isConnected and placeName <> "" then
		    
		    var command as String = "select budget from trip where placeID = (select id from places where place = ?)"
		    
		    try
		      var rs as RowSet = me.SelectSQL(command, placeName)
		      
		      if rs <> nil and rs.RowCount <> 0 then
		        var s as String
		        for each item as DatabaseRow in rs
		          s = item.Column("budget").StringValue
		          if s <> "" then AggregatedBudget = AggregatedBudget + double.FromString(s, locale.Current)
		        next
		      end if
		    catch e as DatabaseException
		      
		    end try
		    
		  end if
		  
		  Return AggregatedBudget
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getBudgetForTrip(tripID as integer) As Double
		  var value as Double
		  
		  if isConnected then
		    
		    var command as String = "select budget from trip where id = ?"
		    
		    try
		      
		      var rs as RowSet = me.SelectSQL(command, tripID)
		      
		      if rs <> nil and rs.RowCount <> 0 then
		        var s as String = rs.Column("budget").StringValue
		        
		        if s <> "" then
		          value = double.FromString(s, locale.Current)
		        end if
		      end if
		      
		    catch e as DatabaseException
		      
		    end try
		  end if
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCategories() As pair()
		  if me.isConnected then
		    if cachedCategories.LastIndex = -1 then
		      var rs as RowSet = me.SelectSQL("select * from categories order by category")
		      for each row as DatabaseRow in rs
		        var np as new Pair( row.Column("id").IntegerValue,  row.Column("category").StringValue )
		        cachedCategories.Add np
		      next
		    end if
		  end if
		  
		  Return me.cachedCategories
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCurrentTrip() As pair
		  var p as pair
		  
		  if isConnected then
		    
		    var command as String = "select * from Trip where isOpened=1 limit 1"
		    
		    var rs as RowSet = me.SelectSQL(command)
		    var rsPlace as RowSet
		    
		    if rs <> nil and rs.RowCount <> 0 then
		      
		      command = "select (place) from Places where id = ?"
		      
		      for each item as DatabaseRow in rs
		        try
		          rsPlace = me.SelectSQL( command, item.Column("placeID").IntegerValue )
		          
		          if rsPlace <> nil and rsPlace.RowCount <> 0 then
		            p = new pair(rs.Column("id").StringValue, rsPlace.Column("place"))
		          end if
		        Catch e as DatabaseException
		          
		        end try
		      next
		      
		    end if
		    
		  end if
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetExpensesForPlace(placeName as String) As Dictionary()
		  var expenses() as Dictionary
		  
		  if isConnected and placeName <> "" then
		    
		    var trips() as Pair
		    
		    var command as string = "select id from trip where placeID = (select id from Places where place = ?)"
		    
		    try
		      
		      var rs as RowSet = me.SelectSQL(command, placeName)
		      var returnedExpenses() as Dictionary
		      if rs <> nil and rs.RowCount <> 0 then
		        for each record as DatabaseRow in rs
		          returnedExpenses = me.GetExpensesForTrip( record.Column("id").IntegerValue)
		          for each item as Dictionary in returnedExpenses
		            expenses.add item
		          next
		        next
		      end if
		      
		    catch e as DatabaseException
		    end try
		  end if
		  
		  Return expenses
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetExpensesForTrip(id as integer) As Dictionary()
		  var data() as Dictionary
		  
		  if isConnected and id <> -1 then
		    
		    var itemData as Dictionary
		    
		    var expensesCachedCategories as new Dictionary
		    
		    var command as String = "select * from expenses where tripID = ? order by date desc"
		    
		    try
		      var rs as RowSet = me.SelectSQL(command, id)
		      
		      if rs <> nil then
		        
		        for each item as DatabaseRow in rs
		          
		          itemData = new Dictionary
		          
		          itemData.Value(kAmount) = item.Column("amount").StringValue
		          itemData.value(kDescription) = item.Column("description").StringValue
		          var d as new DateTime(item.Column("date").DoubleValue)
		          
		          itemData.Value(kDate) = d.SQLDate
		          itemData.Value(kName) = item.Column("name").StringValue
		          itemData.Value(kID) = item.Column("id").StringValue
		          itemData.Value(kLocation) = item.Column("location").StringValue
		          
		          var category as String = item.Column("categoryID").StringValue
		          itemData.Value(kCategoryID) = item.Column("categoryID").StringValue
		          if expensesCachedCategories.HasKey(category)  then
		            itemData.Value(kCategory) = expensesCachedCategories.Value(Category)
		          else
		            
		            for each itemCategory as pair in cachedCategories
		              
		              if itemCategory.Left = Category then
		                expensesCachedCategories.value(Category) = itemCategory.Right.StringValue
		                itemData.Value(kCategory) = itemCategory.Right.StringValue
		                exit
		              end if
		              
		            next
		            
		          end if
		          
		          data.Add itemData
		          
		        next
		        
		      end if
		    Catch e as DatabaseException
		      
		    end try
		  end if
		  
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlaces() As pair()
		  if me.isConnected then
		    if CachedPlaces.LastIndex = -1 then
		      var rs as RowSet = me.SelectSQL("select * from places where isDeleted=0 order by place")
		      for each row as DatabaseRow in rs
		        var np as new Pair( row.Column("id").IntegerValue,  row.Column("place").StringValue )
		        cachedPlaces.Add np
		      next
		    end if
		  end if
		  
		  Return me.CachedPlaces
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTrips() As Dictionary()
		  var trips() As Dictionary
		  var recordDictionary as Dictionary
		  var placeName as RowSet
		  
		  if isConnected then
		    
		    var command as String = "Select * from trip order by startDate desc"
		    
		    try
		      var rs as RowSet = me.SelectSQL(command)
		      
		      if rs <> nil then
		        
		        for each record as databaserow in rs
		          
		          recordDictionary = new Dictionary
		          recordDictionary.Value(kID) = record.Column("id").StringValue
		          recordDictionary.Value(kPlaceID) = record.Column("placeid").StringValue
		          recordDictionary.Value(kDescription) = record.Column("description").StringValue
		          recordDictionary.Value(kBudget) = record.Column("budget").StringValue
		          recordDictionary.Value(kTripType) = record.Column("type").StringValue
		          recordDictionary.Value(kStartDate) = record.column("startDate").stringValue
		          recordDictionary.Value(kEndDate) = record.Column("endDate").StringValue
		          
		          command = "select place from places where id = ?"
		          
		          placeName = me.SelectSQL(command, record.Column("placeid").StringValue)
		          
		          if placeName <> nil and rs.RowCount <> 0 then
		            recordDictionary.Value(kName) = placeName.Column("place").StringValue
		          end if
		          
		          trips.add recordDictionary
		          
		        next
		        
		      end if
		      
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		  
		  Return trips
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function recordExists(tableName As String, columName As String, value As String) As Boolean
		  if isConnected then
		    
		    var command as string = "select " + columName + " from " + tableName + " where " + columName + " like '" + value + "' limit 1"
		    var rs as RowSet = me.SelectSQL(command)
		    
		    if rs <> nil then
		      return rs.RowCount <> 0
		      
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCategory(value as String, id as Integer)
		  if isConnected then
		    
		    var command as String = "Update categories Set category = ? where id = ?"
		    try
		      if not me.recordExists("categories", "category", value) then
		        me.ExecuteSQL( command, value, id.ToString)
		        redim cachedCategories(-1)
		      end if
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateExpense(expense As Dictionary)
		  if isConnected and expense <> nil then
		    
		    var amount as String = expense.Lookup(expensesdb.kAmount, "")
		    var name as String = expense.Lookup(expensesdb.kName, "")
		    var category as String = expense.Lookup(ExpensesDB.kCategory, "")
		    var categoryID as String
		    var recordID as String = expense.Value(expensesdb.kid)
		    var description as String = expense.Lookup(expensesdb.kDescription, "")
		    
		    var command as String 
		    
		    if category <> "" then
		      command = "select id from categories where category= ?"
		      try
		        var rs as RowSet = me.SelectSQL(command, category)
		        
		        if rs <> nil and rs.RowCount <> 0 then
		          categoryID = rs.Column("id")
		        end if
		      Catch e as DatabaseException
		        categoryID = expense.value(ExpensesDB.kCategoryID)
		      end try
		    else
		      categoryID = expense.value(ExpensesDB.kCategoryID)
		    end if
		    
		    command = "update expenses set amount=?, name=?, categoryID=?, description=? where id=?"
		    
		    try
		      me.ExecuteSQL(command, amount, name, categoryID, description, recordid)
		    catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePlace(value as String, id as integer)
		  if isConnected then
		    
		    var command as String = "Update Places Set place = ? where id = ?"
		    try
		      if not me.recordExists("places", "place", value) then
		        me.ExecuteSQL( command, value, id.ToString)
		        redim CachedPlaces(-1)
		      end if
		    Catch e as DatabaseException
		      
		    end try
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected cachedCategories() As pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CachedPlaces() As pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected isConnected As Boolean
	#tag EndProperty


	#tag Constant, Name = kAmount, Type = String, Dynamic = False, Default = \"Amount", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBudget, Type = String, Dynamic = False, Default = \"Budget", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCategory, Type = String, Dynamic = False, Default = \"Category", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCategoryID, Type = String, Dynamic = False, Default = \"CategoryID", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDate, Type = String, Dynamic = False, Default = \"Date", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDescription, Type = String, Dynamic = False, Default = \"Description", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEndDate, Type = String, Dynamic = False, Default = \"End Date", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kID, Type = String, Dynamic = False, Default = \"id", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kIsOpen, Type = String, Dynamic = False, Default = \"isOpen", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocation, Type = String, Dynamic = False, Default = \"Location", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kName, Type = String, Dynamic = False, Default = \"Name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPlaceID, Type = String, Dynamic = False, Default = \"PlaceID", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kStartDate, Type = String, Dynamic = False, Default = \"Start Date", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTripID, Type = String, Dynamic = False, Default = \"TripID", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTripType, Type = String, Dynamic = False, Default = \"TripType", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EncryptionKey"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Visible=true
			Group=""
			InitialValue=""
			Type="Double"
			EditorType="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugMode"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadYieldInterval"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WriteAheadLogging"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LoadExtensions"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LibraryVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
