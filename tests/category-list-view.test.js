/** @jest-environment jsdom */
const fs=require('fs'),vm=require('vm'),$=require('jquery');
const context={CategoryButton:function(){},$,localStorage:{getItem:()=>null,setItem:jest.fn()},zMap:{refreshMap:jest.fn()}};
vm.runInNewContext(fs.readFileSync('scripts/widgets/CategoryMenu.js','utf8'),context);
test('list checkboxes focus multiple categories without navigating to category pages',()=>{
  const categories=[{id:1,checked:true},{id:2,checked:true},{id:3,checked:true}];
  const menu=Object.assign(Object.create(context.CategoryMenu.prototype),{
    modeAutomatic:true,_categoryTreeArr:categories,_categories:categories,
    categoryButtons:categories.map(category=>({category,_toggle:jest.fn()}))
  });
  menu._focusListCategories([categories[0]],true);
  expect(categories.map(c=>c.checked)).toEqual([true,false,false]);
  menu._focusListCategories([categories[1]],true);
  expect(categories.map(c=>c.checked)).toEqual([true,true,false]);
  menu._focusListCategories([categories[0],categories[1]],false);
  expect(menu.modeAutomatic).toBe(true);
  expect(categories.every(c=>c.checked)).toBe(true);
});
test('section checkbox shows a mixed state for partially focused sections',()=>{
  const input=$('<input type="checkbox">');
  const menu=Object.assign(Object.create(context.CategoryMenu.prototype),{modeAutomatic:false,listChecks:[{input,categories:[{checked:true},{checked:false}]}]});
  menu._syncListView();
  expect(input.prop('indeterminate')).toBe(true);
  expect(input.prop('checked')).toBe(false);
});

test('section Focus pills reflect focus rather than automatic visibility',()=>{
  const toggle=$('<button></button>'),categories=[{checked:true},{checked:true}];
  const menu=Object.assign(Object.create(context.CategoryMenu.prototype),{modeAutomatic:true,poiCategoryGroups:[{title:'Collectibles',categories,toggle}]});
  menu.updateCategoryGroupControls();
  expect(toggle.text()).toBe('Focus');
  expect(toggle.attr('aria-pressed')).toBe('false');
  menu.modeAutomatic=false;
  menu.updateCategoryGroupControls();
  expect(toggle.attr('aria-pressed')).toBe('true');
});
