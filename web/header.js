/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function doSearch(){
    
    var tableReg = document.getElementById('datos');
    var searchText = document.getElementById('searchTerm').value.toLowerCase();
    var cellsOfRow = "";
    var found = false;
    var compareWith = "";
    
    for(var i = 1; i < tableReg.rows.length; i++)
    {
        
        cellsOfRow = tableReg.rows[i].getElementsByTagName('th');
        
        found = false;
    
        for (var j = 0; j < cellsOfRow.length && !found; j++)
        {
          
                compareWith = cellsOfRow[j].innerHTML.toLowerCase();
              
          
            if(searchText.length === 0 || (compareWith.indexOf(searchText)> - 1))
            {
                found = true;
            }
        }
        
        if(found)
        
        {
            
            tableReg.rows[i].style.display = '';
            
        }else 
        
        {
            if(tableReg.rows[i].id != "header")
            {
                tableReg.rows[i].style.display = 'none';
            }
        }
    }
    
}
