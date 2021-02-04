
using PartitionedArrays

function test_p_timers(parts)

  t = PTimer(parts)
  
  tic!(t)
  toc!(t,"Phase 1")
  toc!(t,"Phase 3")
  sleep(0.2)
  toc!(t,"Phase 143")
  tic!(t)
  sleep(0.4)
  toc!(t,"Matrix Assembly")

  display(t.data)

  map_main(t.data) do data
    open("times.txt","w") do io
      println(io,data)
    end
  end
  
  display(t)

end

