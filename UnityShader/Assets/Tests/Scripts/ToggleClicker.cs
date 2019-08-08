using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ToggleClicker : MonoBehaviour
{
    public string targetValueName;
    public bool switchOn;
    private Material _TargetMaterial;

    // Start is called before the first frame update
    void Start()
    {
        _TargetMaterial = GetComponent<Renderer>().sharedMaterial;
        switchOn = false;
    }
    private void OnMouseDown()
    {
        toggleSwitch();
    }

    private void toggleSwitch()
    {
        switchOn = !switchOn;
        _TargetMaterial.SetFloat(targetValueName, switchOn ? 1 : 0);
    }
}
