import data from './data'
import './styles.css';
import React,{useState} from 'react';
function Index(){
    const [selected,setSelected] = useState(null);
    const [enableMultiSelection,setEnableMultiSelection] = useState(false);
    const [multiple,setMultiple] = useState([]);

    function handleSingleSelection(getCurrentID){
        setSelected(getCurrentID === selected ? null : getCurrentID);
    }
    function multiSelection(getCurrentID){
        //sperad operator
        let cpymultiple = [...multiple];
        const findIndexofCurrentId = cpymultiple.indexOf(getCurrentID);
        // this will add the elements
        if(findIndexofCurrentId === -1) cpymultiple.push(getCurrentID);
        // this method is remove the id form the inex
        else cpymultiple.splice(findIndexofCurrentId,1)
        setMultiple(cpymultiple);
    }

    return (
        <>
        <div className="multiplebutton" onClick={()=>setEnableMultiSelection(!enableMultiSelection)}>Multiple Selection</div>
        <div className="container">
            {
                data && data.length > 0 ?
                data.map(item =>
                    <div>
                        <div className="wrapper" onClick={enableMultiSelection ?() =>multiSelection (item.id) : ()=>handleSingleSelection(item.id)}>
                    <h3>{item.Question}</h3>
                    <span>+</span>
                        </div>
                        {
                            selected === item.id || multiple.indexOf(item.id) !== -1 ?
                            <div className="answer">{item.answer}</div>
                            :null
                        }
                    </div>)
                :<div>No data found</div>
            }
        </div>
        </>
    )
}
export default Index;